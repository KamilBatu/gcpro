import 'package:gcpro/services/user_cache_service/data/datasource/user_local_datasource.dart';
import 'package:gcpro/services/user_cache_service/domain/models/user_core.dart';
import 'package:gcpro/services/user_cache_service/domain/repositories/user_repository.dart';
import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';

class UserCacheRepositoryImpl extends UserCacheRepository {
  UserCacheRepositoryImpl(this.dataSource);

  final LocalUserDataSource dataSource;

  @override
  Future<bool> cacheUser(UserCore user) {
    return dataSource.cacheUser(user);
  }

  @override
  Future<bool> deleteUser() {
    return dataSource.deleteUser();
  }

  @override
  Future<Either<AppException, UserCore>> getUser() {
    return dataSource.getUser();
  }

  @override
  Future<Either<AppException, UserCore>> invalidateUser() {
    return dataSource.invalidateUser();
  }

  @override
  Future<Either<AppException, bool>> updateUser(Map<String, String> data) {
    return dataSource.updateUser(data);
  }
}
