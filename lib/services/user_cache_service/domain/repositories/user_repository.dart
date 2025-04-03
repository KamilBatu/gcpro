import 'package:gcpro/services/user_cache_service/domain/models/user_core.dart';
import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';

abstract class UserCacheRepository {
  Future<Either<AppException, UserCore>> getUser();
  Future<Either<AppException, UserCore>> invalidateUser();
  Future<bool> cacheUser(UserCore user);
  Future<Either<AppException, bool>> updateUser(Map<String, String> data);
  Future<bool> deleteUser();
}
