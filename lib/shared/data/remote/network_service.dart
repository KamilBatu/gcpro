import 'package:gcpro/shared/domain/models/either.dart';
import 'package:gcpro/shared/domain/models/response.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  Map<String, Object> get headers;

  void updateHeader(Map<String, String> newHeaders);

  void clearHeader();

  Future<Either<AppException, Response>> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  });

  Future<Either<AppException, Response>> post(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, Response>> put(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, Response>> delete(
    String endpoint, {
    Map<String, dynamic>? data,
  });

  Future<Either<AppException, Response>> patch(
    String endpoint, {
    Map<String, dynamic>? data,
  });
}
