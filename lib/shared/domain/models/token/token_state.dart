import 'package:gcpro/shared/domain/models/token/token_model.dart';
import 'package:gcpro/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_state.freezed.dart';

@freezed
abstract class TokenState with _$TokenState {
  const factory TokenState.initial() = Initial;
  const factory TokenState.loading() = Loading;
  const factory TokenState.logout() = LogOut;
  const factory TokenState.failure(AppException exception) = Failure;
  const factory TokenState.success(Token token) = Success;
}
