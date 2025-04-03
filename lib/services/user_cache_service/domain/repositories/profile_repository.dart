import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';

abstract class ProfileCacheRepository {
  Future<Either<AppException, String>> fetchProfile();
  Future<bool> saveProfile({required String id});
  Future<bool> deleteProfile();
  Future<bool> hasProfile();
}
