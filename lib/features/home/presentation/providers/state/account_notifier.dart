import 'package:gcpro/features/home/presentation/providers/state/account_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountNotifier extends StateNotifier<AccountState> {
  AccountNotifier() : super(const AccountState.initial());
  // final AuthRepository repository;

  Future<void> changeAccount(
    (String, String) account,
  ) async {
    state = const AccountState.loading();

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

    state = AccountState.success(
      AccountSuccessState(
        'User logged in successfully',
        currentAccount: account,
        token: "token",
      ),
    );
  }
}
