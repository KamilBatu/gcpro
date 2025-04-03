import 'package:gcpro/services/services_provider.dart';
import 'package:gcpro/services/token_cache_service/domain/providers/token_cache_provider.dart';
import 'package:gcpro/services/token_cache_service/domain/repositories/token_cache_repository.dart';
import 'package:gcpro/shared/data/remote/endpoint.dart';
import 'package:gcpro/shared/exceptions/status_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkServiceInterceptorProvider =
    Provider.family<NetworkServiceInterceptor, Dio>(
  (ref, dio) {
    final tokenService = ref.watch(tokenServiceProvider);

    return NetworkServiceInterceptor(tokenService, dio);
  },
  name: 'networkServiceInterceptorProvider',
);

final class NetworkServiceInterceptor extends Interceptor {
  NetworkServiceInterceptor(this._tokenService, this._dio);
  final TokenRepository _tokenService;
  final Dio _dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenService.getAccessToken();

    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    // if the access token is not null, add it to the request headers
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // handle unauthorized error
    if (err.response?.statusCode == unauthorized &&
        !loginEndPoint.contains(err.requestOptions.path)) {
      final token = await _tokenService.getRefreshToken();

      if (token == null) return handler.next(err);

      try {
        // refresh token request - api call
        final result = await _tokenService.refreshToken(token);

        final accesToken = result.accessToken;
        final refreshToken = result.refreshToken;

        // save new access token and refresh token to secure storage
        final saved = await _tokenService.saveToken(accesToken, refreshToken);
        if (!saved) return handler.next(err);

        final options = err.requestOptions;
        // update request headers with new access token

        options.headers['Authorization'] = 'Bearer $accesToken';

        // repeat the request with new access token
        return handler.resolve(await _dio.fetch(options));
      } on DioException catch (e) {
        if (e.response?.statusCode == refreshTokenExpired) {
          // remove access token and refresh token from secure storage
          await _tokenService.clearToken();

          return handler.next(err);
        }

        // continue with the error
        return handler.next(err);
      }
    }
    // continue with the error
    return handler.next(err);
  }
}
