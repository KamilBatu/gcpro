import 'package:gcpro/services/token_cache_service/data/models/refresh_token_response.dart';
import 'package:gcpro/services/token_cache_service/domain/repositories/token_cache_repository.dart';
import 'package:gcpro/shared/data/local/secure_storage_const.dart';
import 'package:gcpro/shared/data/local/storage_service.dart';
import 'package:gcpro/shared/exceptions/status_code.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

import 'package:jwt_decoder/jwt_decoder.dart';

class TokenRepositoryImpl implements TokenRepository {
  TokenRepositoryImpl(this._dio, this._secureStorage);
  final Dio _dio;
  final StorageService _secureStorage;

  @override
  Future<void> clearToken() {
    // make sure secure storage has been initialized
    if (!_secureStorage.hasInitialized) {
      throw Exception('Storage service has not been initialized');
    }

    return Future.wait([
      _secureStorage.remove(ACCESS_TOKEN_KEY),
      _secureStorage.remove(REFRESH_TOKEN_KEY),
    ]);
  }

  @override
  Future<String?> getAccessToken() =>
      _secureStorage.get(ACCESS_TOKEN_KEY) as Future<String?>;

  @override
  Future<String?> getRefreshToken() =>
      _secureStorage.get(REFRESH_TOKEN_KEY) as Future<String?>;

  @override
  Future<bool> hasToken() {
    // make sure secure storage has been initialized
    if (!_secureStorage.hasInitialized) {
      throw Exception('Storage service has not been initialized');
    }

    final accessToken = _secureStorage.get(ACCESS_TOKEN_KEY);
    final refreshToken = _secureStorage.get(REFRESH_TOKEN_KEY);

    return Future.wait([accessToken, refreshToken])
        .then((value) => value.every((element) => element != null));
  }

  @override
  Future<RefreshTokenResponse> refreshToken(String? refreshToken) async {
    _dio.interceptors.add(
      HttpFormatter(
        loggingFilter: (request, response, error) {
          return true;
        },
      ),
    );
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/token/refresh',
      options: Options(headers: {"Authorization": "Bearer $refreshToken"}),
    );

    if ([success, created].contains(response.statusCode)) {
      return RefreshTokenResponse.fromJson(response.data ?? {});
    } else {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
      );
    }
  }

  @override
  Future<bool> saveToken(String accessToken, String refreshToken) async {
    final saved = await _secureStorage.set(ACCESS_TOKEN_KEY, accessToken);
    final savedBoth = await _secureStorage.set(REFRESH_TOKEN_KEY, refreshToken);

    return saved && savedBoth;
  }

  @override
  Future<String?> getUserId() async {
    final token = await _secureStorage.get(ACCESS_TOKEN_KEY);

    if (token == null) return null;
    final Map<String, dynamic> decodedToken =
        JwtDecoder.decode(token.toString());
    return decodedToken['sub'] as String?;
  }
}
