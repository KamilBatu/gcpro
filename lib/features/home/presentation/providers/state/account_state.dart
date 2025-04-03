import 'package:gcpro/shared/exceptions/http_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_state.freezed.dart';

@freezed
abstract class AccountState with _$AccountState {
  const factory AccountState.initial() = AccountInitial;
  const factory AccountState.loading() = AccountLoading;
  const factory AccountState.failure(AppException exception) = AccountFailure;
  const factory AccountState.success(AccountSuccessState success) =
      AccountSuccess;
}

@immutable
class AccountSuccessState {
  const AccountSuccessState(this.message, {this.token, this.currentAccount});
  final String message;
  final String? token;
  final (String, String)? currentAccount;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountSuccessState && other.message == message;
  }

  @override
  int get hashCode =>
      message.hashCode ^ token.hashCode ^ currentAccount.hashCode;

  AccountSuccessState copyWith({
    String? message,
    String? token,
    (String, String)? currentAccount,
  }) {
    return AccountSuccessState(
      message ?? this.message,
      token: token ?? this.token,
      currentAccount: currentAccount ?? this.currentAccount,
    );
  }
}
