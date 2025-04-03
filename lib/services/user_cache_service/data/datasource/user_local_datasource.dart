import 'dart:convert';

import 'package:gcpro/services/user_cache_service/data/datasource/user_remote_datasource.dart';
import 'package:gcpro/services/user_cache_service/domain/models/user_core.dart';
import 'package:gcpro/shared/data/local/secure_storage_const.dart';
import 'package:gcpro/shared/data/local/storage_service.dart';
import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';

abstract class LocalUserDataSource {
  String get storageKey;

  Future<Either<AppException, UserCore>> getUser();
  Future<Either<AppException, UserCore>> invalidateUser();
  Future<Either<AppException, bool>> updateUser(Map<String, String> data);
  Future<bool> cacheUser(UserCore user);
  Future<bool> deleteUser();
}

class UserLocalDatasourceImpl extends LocalUserDataSource {
  UserLocalDatasourceImpl(this.storageService, this.remoteService);

  final StorageService storageService;
  final UserDataRemoteSource remoteService;

  @override
  String get storageKey => USER_LOCAL_STORAGE_KEY;

  @override
  Future<Either<AppException, UserCore>> getUser() async {
    final result = await storageService.get(storageKey);
    if (result == null) {
      final user = await remoteService.fetchUser();

      return user.fold(
        Left.new,
        (user) async {
          await storageService.set(storageKey, jsonEncode(user));
          return Right(user);
        },
      );
    } else {
      final user = jsonDecode(result.toString()) as Map<String, dynamic>;
      return Right(UserCore.fromJson(user));
    }
  }

  @override
  Future<bool> cacheUser(UserCore user) async {
    final result = await storageService.set(storageKey, jsonEncode(user));

    return result;
  }

  @override
  Future<bool> deleteUser() {
    return storageService.remove(storageKey);
  }

  @override
  Future<Either<AppException, bool>> updateUser(
    Map<String, String> data,
  ) async {
    final updatedUser = await remoteService.updateUser(data);

    return updatedUser.fold(
      Left.new,
      (user) async {
        await storageService.set(storageKey, jsonEncode(user));
        return const Right(true);
      },
    );
  }

  @override
  Future<Either<AppException, UserCore>> invalidateUser() async {
    final user = await remoteService.fetchUser();

    user.fold(
      Left.new,
      (user) async {
        await storageService.set(storageKey, jsonEncode(user));
        return user;
      },
    );

    return user;
  }
}
