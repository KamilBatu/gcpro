import 'package:gcpro/shared/data/local/secure_storage_const.dart';
import 'package:gcpro/shared/data/local/storage_service.dart';
import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';

abstract class LocalDefaultProfileDataSource {
  String get storageKey;

  Future<Either<AppException, String>> fetchProfile();
  Future<bool> saveProfile({required String user});
  Future<bool> deleteProfile();
  Future<bool> hasProfile();
}

class ProfileLocalDatasource extends LocalDefaultProfileDataSource {
  ProfileLocalDatasource(this.storageService);

  final StorageService storageService;

  @override
  String get storageKey => USER_PROFILE_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, String>> fetchProfile() async {
    final result = await storageService.get(storageKey);
    if (result == null) {
      return Left(
        AppException(
          message: 'No user profile found',
          statusCode: 404,
          identifier: 'ProfileLocalDatasource',
        ),
      );
    } else {
      return Right(result.toString());
    }
  }

  @override
  Future<bool> saveProfile({required String user}) async {
    final result = await storageService.set(storageKey, user);

    return result;
  }

  @override
  Future<bool> deleteProfile() {
    return storageService.remove(storageKey);
  }

  @override
  Future<bool> hasProfile() {
    return storageService.has(storageKey);
  }
}
