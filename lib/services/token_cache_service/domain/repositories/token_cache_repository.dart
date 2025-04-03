import 'package:gcpro/services/token_cache_service/data/models/refresh_token_response.dart';

abstract interface class TokenRepository {
  Future<String?> getAccessToken();

  Future<String?> getUserId();

  Future<String?> getRefreshToken();

  Future<bool> saveToken(String accessToken, String refreshToken);

  Future<void> clearToken();

  Future<bool> hasToken();

  Future<RefreshTokenResponse> refreshToken(String? refreshToken);
}
