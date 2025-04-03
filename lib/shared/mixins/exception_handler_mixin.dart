import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:gcpro/shared/data/remote/remote.dart';
import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/domain/models/response.dart' as response;
import 'package:gcpro/shared/exceptions/http_exception.dart';
import 'package:dio/dio.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>>
      handleException<T extends Object>(
    Future<Response<dynamic>> Function() handler, {
    String endpoint = '',
  }) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      int statusCode = 0;
      log(e.runtimeType.toString());
      switch (e.runtimeType) {
        case SocketException _:
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
        case DioException _:
          e as DioException;
          message = (e.response?.data?['message'] ?? 'Internal Error occurred')
              .toString();
          statusCode = 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';

        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error $e\n at $endpoint';
      }
      return Left(
        AppException(
          message: message,
          statusCode: statusCode,
          identifier: identifier,
        ),
      );
    }
  }
}
