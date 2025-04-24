// something is wrong with the dio package
// ignore_for_file: inference_failure_on_function_invocation

import 'dart:io';

import 'package:gcpro/configs/app_configs.dart';
import 'package:gcpro/shared/utils/network_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

class FileUploadService {
  FileUploadService(this._dio, this._networkServiceInterceptor);
  final Dio _dio;
  final NetworkServiceInterceptor _networkServiceInterceptor;

  Future<String?> uploadFile(File file) async {
    _dio.options.baseUrl = AppConfigs.fileBaseUrl;
    _dio.interceptors.addAll([
      HttpFormatter(loggingFilter: (request, response, error) => true),
      _networkServiceInterceptor,
    ]);

    var fileType = file.path.split('.').last;

    if (fileType == 'jpg') {
      fileType = 'jpeg';
    }

    // First, hit the /file/upload/request endpoint to get the upload token
    final tokenResponse = await _dio.post(
      '/file/upload/request',
      data: {
        "fileSize": file.lengthSync(),
        "mimeType": "image/$fileType",
      },
    );

    if (tokenResponse.statusCode != 201) {
      throw Exception('Failed to get upload token');
    }

    final token = tokenResponse.data['token'];

    // Then, create a MultipartFile object from the file
    final data = FormData.fromMap({
      'file': MultipartFile.fromBytes(
        file.readAsBytesSync(),
        filename: file.path.split('/').last,
        contentType: DioMediaType('image', fileType),
      ),
    });

    _dio.options.headers['Authorization'] = 'Bearer $token';
    _dio.interceptors.remove(_networkServiceInterceptor);

    // Then, upload the file using the /file/upload endpoint
    final fileResponse = await _dio.post(
      '/file/upload',
      data: data,
    );

    if (fileResponse.statusCode != 201) {
      throw Exception('Failed to upload file');
    }

    return fileResponse.data['fileUrl'] as String?;
  }
}
