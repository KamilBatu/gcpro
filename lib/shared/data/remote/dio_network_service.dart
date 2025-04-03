import 'package:gcpro/configs/app_configs.dart';
import 'package:gcpro/shared/data/remote/network_service.dart';
import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/domain/models/response.dart' as response;
import 'package:gcpro/shared/exceptions/http_exception.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:gcpro/shared/mixins/exception_handler_mixin.dart';
import 'package:gcpro/shared/utils/device_info.dart';
import 'package:gcpro/shared/utils/network_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/foundation.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  DioNetworkService({
    required this.dio,
    required this.networkServiceInterceptor,
  }) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors.addAll([
          HttpFormatter(
            loggingFilter: (request, response, error) => true,
          ),
          networkServiceInterceptor,
        ]);
      }
    }

    getDeviceInfo().then(
      (deviceInfo) => dio.options.headers.addAll({
        'device-info': deviceInfo,
      }),
    );
  }
  final Dio dio;
  final NetworkServiceInterceptor networkServiceInterceptor;

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        validateStatus: (status) => status != 401,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        sendTimeout: const Duration(seconds: 60),
      );
  @override
  String get baseUrl => AppConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
        'accept': 'application/json',
        'content-type': 'application/json',
      };

  @override
  DioNetworkService updateHeader(Map<String, String> newHeaders) {
    if (!kTestMode) {
      dio.options.headers = headers..addAll(newHeaders);
    }
    return this;
  }

  @override
  DioNetworkService clearHeader() {
    dio.options.headers = {
      'accept': 'application/json',
      'content-type': 'application/json',
    };
    return this;
  }

  @override
  Future<Either<AppException, response.Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.delete(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> patch(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.patch(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  }) {
    final res = handleException(
      () => dio.put(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
