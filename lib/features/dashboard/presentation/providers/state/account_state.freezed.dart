// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AccountState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountState()';
  }
}

/// @nodoc
class $AccountStateCopyWith<$Res> {
  $AccountStateCopyWith(AccountState _, $Res Function(AccountState) __);
}

/// @nodoc

class AccountInitial implements AccountState {
  const AccountInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AccountInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountState.initial()';
  }
}

/// @nodoc

class AccountLoading implements AccountState {
  const AccountLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AccountLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AccountState.loading()';
  }
}

/// @nodoc

class AccountFailure implements AccountState {
  const AccountFailure(this.exception);

  final AppException exception;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountFailureCopyWith<AccountFailure> get copyWith =>
      _$AccountFailureCopyWithImpl<AccountFailure>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountFailure &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @override
  String toString() {
    return 'AccountState.failure(exception: $exception)';
  }
}

/// @nodoc
abstract mixin class $AccountFailureCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory $AccountFailureCopyWith(
          AccountFailure value, $Res Function(AccountFailure) _then) =
      _$AccountFailureCopyWithImpl;
  @useResult
  $Res call({AppException exception});
}

/// @nodoc
class _$AccountFailureCopyWithImpl<$Res>
    implements $AccountFailureCopyWith<$Res> {
  _$AccountFailureCopyWithImpl(this._self, this._then);

  final AccountFailure _self;
  final $Res Function(AccountFailure) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? exception = null,
  }) {
    return _then(AccountFailure(
      null == exception
          ? _self.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as AppException,
    ));
  }
}

/// @nodoc

class AccountSuccess implements AccountState {
  const AccountSuccess(this.success);

  final AccountSuccessState success;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountSuccessCopyWith<AccountSuccess> get copyWith =>
      _$AccountSuccessCopyWithImpl<AccountSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountSuccess &&
            (identical(other.success, success) || other.success == success));
  }

  @override
  int get hashCode => Object.hash(runtimeType, success);

  @override
  String toString() {
    return 'AccountState.success(success: $success)';
  }
}

/// @nodoc
abstract mixin class $AccountSuccessCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory $AccountSuccessCopyWith(
          AccountSuccess value, $Res Function(AccountSuccess) _then) =
      _$AccountSuccessCopyWithImpl;
  @useResult
  $Res call({AccountSuccessState success});
}

/// @nodoc
class _$AccountSuccessCopyWithImpl<$Res>
    implements $AccountSuccessCopyWith<$Res> {
  _$AccountSuccessCopyWithImpl(this._self, this._then);

  final AccountSuccess _self;
  final $Res Function(AccountSuccess) _then;

  /// Create a copy of AccountState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? success = null,
  }) {
    return _then(AccountSuccess(
      null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as AccountSuccessState,
    ));
  }
}

// dart format on
