import 'package:gcpro/services/user_cache_service/data/datasource/profile_local_datasource.dart';
import 'package:gcpro/services/user_cache_service/domain/repositories/profile_repository.dart';
import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';

class ProfileCacheRepositoryImpl extends ProfileCacheRepository {
  ProfileCacheRepositoryImpl(this.dataSource);

  final LocalDefaultProfileDataSource dataSource;

  @override
  Future<bool> deleteProfile() {
    return dataSource.deleteProfile();
  }

  @override
  Future<Either<AppException, String>> fetchProfile() {
    return dataSource.fetchProfile();
  }

  @override
  Future<bool> saveProfile({required String id}) {
    return dataSource.saveProfile(user: id);
  }

  @override
  Future<bool> hasProfile() {
    return dataSource.hasProfile();
  }
}
