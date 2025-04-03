import 'package:gcpro/shared/exceptions/http_exception.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.failure(AppException exception) = AuthFailure;
  const factory AuthState.success(SuccessState success) = AuthSuccess;
}
