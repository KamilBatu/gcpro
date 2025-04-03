import 'package:gcpro/shared/data/remote/file_upload_service.dart';
import 'package:gcpro/shared/utils/network_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fileUploadServiceProvider = Provider<FileUploadService>(
  (ref) {
    final Dio dio = Dio();
    final networkServiceInterceptor = ref.watch(
      networkServiceInterceptorProvider(dio),
    );

    return FileUploadService(dio, networkServiceInterceptor);
  },
  name: 'fileUploadServiceProvider',
);
