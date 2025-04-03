import 'package:gcpro/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/shared/domain/providers/username_type_provider.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.repository) : super(const AuthState.initial());
  final AuthRepository repository;

  Future<void> loginUser(
    String username,
    String password,
    UsernameType usernameType,
  ) async {
    state = const AuthState.loading();

    // final response = await repository.loginUser(
    //   user: User(username: username, password: password),
    //   phone: usernameType == UsernameType.phone,
    // );

    // state = await response.fold(
    //   (failure) => AuthState.failure(failure),
    //   (user) => const AuthState.success(SuccessState.userLoggedIn),
    // );

    // delay for 2 seconds
    await Future<void>.delayed(const Duration(seconds: 3));

    state = const AuthState.success(SuccessState.userLoggedIn);
  }

  Future<void> logoutUser() async {
    state = const AuthState.loading();
    // final response = await authRepository.logoutUser();

    // state = await response.fold(
    //   (failure) => AuthState.failure(failure),
    //   (user) => const AuthState.success(SuccessState.userLoggedOut),
    // );

    // delay for 2 seconds
    await Future<void>.delayed(const Duration(seconds: 3));

    state = const AuthState.success(SuccessState.userLoggedOut);
  }

  Future<void> registerUser(String username, String password) async {
    state = const AuthState.loading();

    // final response = await authRepository.registerUser(
    //   user: User(username: username, password: password),
    // );

    // state = await response.fold(
    //   (failure) => AuthState.failure(failure),
    //   (user) => const AuthState.success(SuccessState.userRegistered),
    // );

    // delay for 2 seconds
    await Future<void>.delayed(const Duration(seconds: 3));

    state = const AuthState.success(SuccessState.userRegistered);
  }

  Future<void> otpVerify({
    required String username,
    required String value,
    OTPType otpType = OTPType.TWO_FACTOR_AUTHENTICATION,
  }) async {
    state = const AuthState.loading();
    // final response = await authRepository.otpVerification(username: username, value: value, otpType: otpType);

    // state = await response.fold(
    //   (failure) => AuthState.failure(failure),
    //   (user) => const AuthState.success(SuccessState.otpVerified),
    // );

    // delay for 2 seconds
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AuthState.success(SuccessState.otpVerified);
  }

  Future<void> sendTwoFactorAuthentication(String username) async {
    state = const AuthState.loading();
    // final response = await authRepository.primaryTwoFactorAuthentication(username: username);

    // response.fold((failure) => AuthState.failure(failure), (twoFactorMethodType) {
    //   otpSend(value: username, otpType: OTPType.TWO_FACTOR_AUTHENTICATION, identifier: twoFactorMethodType);
    // });

    // delay for 2 seconds
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AuthState.success(SuccessState.otpSent);
  }

  Future<void> resetPassword(String username, String newPassword) async {
    state = const AuthState.loading();
    // final response = await authRepository.resetPassword(username: username, newPassword: newPassword);

    // state = await response.fold(
    //   (failure) => AuthState.failure(failure),
    //   (user) => const AuthState.success(SuccessState.passwordChanged),
    // );

    // delay for 2 seconds
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AuthState.success(SuccessState.passwordChanged);
  }

  Future<void> otpSend({
    required String value,
    required OTPType otpType,
    required String identifier,
  }) async {
    state = const AuthState.loading();
    // final response = await authRepository.otpSend(value: value, otpType: otpType, identifier: identifier);

    // state = await response.fold(
    //   (failure) => AuthState.failure(failure),
    //   (user) => const AuthState.success(SuccessState.otpSent),
    // );

    // delay for 2 seconds
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AuthState.success(SuccessState.otpSent);
  }

  Future<void> otpResend({
    String? email,
    String? phone,
    OTPType otpType = OTPType.TWO_FACTOR_AUTHENTICATION,
  }) async {
    state = const AuthState.loading();
    // final response = await authRepository.otpResend(value: email ?? phone, otpType: otpType);

    // state = await response.fold(
    //   (failure) => AuthState.failure(failure),
    //   (user) => const AuthState.success(SuccessState.otpResended),
    // );

    // delay for 2 seconds
    await Future<void>.delayed(const Duration(seconds: 3));
    state = const AuthState.success(SuccessState.otpResended);
  }
}
