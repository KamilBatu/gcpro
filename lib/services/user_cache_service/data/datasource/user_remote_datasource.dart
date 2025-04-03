import 'package:gcpro/services/token_cache_service/domain/repositories/token_cache_repository.dart';
import 'package:gcpro/services/user_cache_service/domain/models/user_core.dart';
import 'package:gcpro/shared/data/remote/network_service.dart';
import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';
import 'package:gcpro/shared/utils/message_humanize.dart';

abstract class UserDataRemoteSource {
  Future<Either<AppException, bool>> deleteUser();
  Future<Either<AppException, UserCore>> fetchUser();
  Future<Either<AppException, UserCore>> updateUser(Map<String, String> data);
}

class UserRemoteSource extends UserDataRemoteSource {
  UserRemoteSource(this.networkService, this.tokenRepository);
  final NetworkService networkService;
  final TokenRepository tokenRepository;

  /// Sends an HTTP request to the given [url] using the specified [method]
  /// and optional [data]. Parses the response using [fromJson] to return
  /// an instance of type [T].
  ///
  /// Returns a [Right] containing the parsed response if the request is
  /// successful (status code 200 or 201). Returns a [Left] containing an
  /// [AppException] if the request fails or an exception is caught.
  ///
  /// Supported HTTP methods: 'post', 'put', 'delete', 'get', 'patch'.
  ///
  /// Throws an [AppException] with a message and status code on failure.

  Future<Either<AppException, T>> _request<T>(
    String url, {
    required String method,
    required T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic>? data,
  }) async {
    try {
      Either<AppException, dynamic>? eitherType;

      if (method == 'post') {
        eitherType = await networkService.post(
          url,
          data: data,
        );
      }
      if (method == 'put') {
        eitherType = await networkService.put(
          url,
          data: data,
        );
      }
      if (method == 'delete') eitherType = await networkService.delete(url);
      if (method == 'get') eitherType = await networkService.get(url);
      if (method == 'patch') {
        eitherType = await networkService.patch(
          url,
          data: data,
        );
      }

      return eitherType!.fold(
        Left.new,
        (response) {
          if ([200, 201].contains(response.statusCode)) {
            return Right(fromJson(response.data as Map<String, dynamic>));
          }

          return Left(
            AppException(
              message: humanizeMessage(response.data['message'].toString()),
              statusCode: response.statusCode as int,
              identifier: url,
            ),
          );
        },
      );
    } catch (e) {
      // print(e);
      return Left(
        AppException(
          message: 'Something went wrong',
          statusCode: 500,
          identifier: '$e\n$url',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, bool>> deleteUser() async {
    final userId = await tokenRepository.getUserId();

    return _request(
      '/user/$userId',
      method: 'delete',
      fromJson: (json) => json['message'] == 'User deleted successfully',
    );
  }

  @override
  Future<Either<AppException, UserCore>> fetchUser() async {
    final userId = await tokenRepository.getUserId();

    return _request(
      '/user/$userId',
      method: 'get',
      fromJson: UserCore.fromJson,
    );
  }

  @override
  Future<Either<AppException, UserCore>> updateUser(
      Map<String, String> data) async {
    return _request(
      '/auth/user/update',
      method: 'patch',
      data: data,
      fromJson: UserCore.fromJson,
    );
  }
}
