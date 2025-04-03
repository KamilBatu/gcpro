// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_core.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserCore {
  @JsonKey(name: "id")
  String get id;
  @JsonKey(name: "email")
  String? get email;
  @JsonKey(name: "phoneNumber")
  String? get phoneNumber;
  @JsonKey(name: "passwordExists")
  bool get passwordExists;
  @JsonKey(name: "accountStatus")
  String get accountStatus;
  @JsonKey(name: "isActive")
  bool get isActive;
  @JsonKey(name: "lastLogin")
  DateTime get lastLogin;
  @JsonKey(name: "twoStepEnabled")
  bool get twoStepEnabled;

  /// Create a copy of UserCore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCoreCopyWith<UserCore> get copyWith =>
      _$UserCoreCopyWithImpl<UserCore>(this as UserCore, _$identity);

  /// Serializes this UserCore to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCore &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.passwordExists, passwordExists) ||
                other.passwordExists == passwordExists) &&
            (identical(other.accountStatus, accountStatus) ||
                other.accountStatus == accountStatus) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.twoStepEnabled, twoStepEnabled) ||
                other.twoStepEnabled == twoStepEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, phoneNumber,
      passwordExists, accountStatus, isActive, lastLogin, twoStepEnabled);

  @override
  String toString() {
    return 'UserCore(id: $id, email: $email, phoneNumber: $phoneNumber, passwordExists: $passwordExists, accountStatus: $accountStatus, isActive: $isActive, lastLogin: $lastLogin, twoStepEnabled: $twoStepEnabled)';
  }
}

/// @nodoc
abstract mixin class $UserCoreCopyWith<$Res> {
  factory $UserCoreCopyWith(UserCore value, $Res Function(UserCore) _then) =
      _$UserCoreCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phoneNumber") String? phoneNumber,
      @JsonKey(name: "passwordExists") bool passwordExists,
      @JsonKey(name: "accountStatus") String accountStatus,
      @JsonKey(name: "isActive") bool isActive,
      @JsonKey(name: "lastLogin") DateTime lastLogin,
      @JsonKey(name: "twoStepEnabled") bool twoStepEnabled});
}

/// @nodoc
class _$UserCoreCopyWithImpl<$Res> implements $UserCoreCopyWith<$Res> {
  _$UserCoreCopyWithImpl(this._self, this._then);

  final UserCore _self;
  final $Res Function(UserCore) _then;

  /// Create a copy of UserCore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? passwordExists = null,
    Object? accountStatus = null,
    Object? isActive = null,
    Object? lastLogin = null,
    Object? twoStepEnabled = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordExists: null == passwordExists
          ? _self.passwordExists
          : passwordExists // ignore: cast_nullable_to_non_nullable
              as bool,
      accountStatus: null == accountStatus
          ? _self.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastLogin: null == lastLogin
          ? _self.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      twoStepEnabled: null == twoStepEnabled
          ? _self.twoStepEnabled
          : twoStepEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserCore implements UserCore {
  const _UserCore(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "email") required this.email,
      @JsonKey(name: "phoneNumber") required this.phoneNumber,
      @JsonKey(name: "passwordExists") required this.passwordExists,
      @JsonKey(name: "accountStatus") required this.accountStatus,
      @JsonKey(name: "isActive") required this.isActive,
      @JsonKey(name: "lastLogin") required this.lastLogin,
      @JsonKey(name: "twoStepEnabled") required this.twoStepEnabled});
  factory _UserCore.fromJson(Map<String, dynamic> json) =>
      _$UserCoreFromJson(json);

  @override
  @JsonKey(name: "id")
  final String id;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;
  @override
  @JsonKey(name: "passwordExists")
  final bool passwordExists;
  @override
  @JsonKey(name: "accountStatus")
  final String accountStatus;
  @override
  @JsonKey(name: "isActive")
  final bool isActive;
  @override
  @JsonKey(name: "lastLogin")
  final DateTime lastLogin;
  @override
  @JsonKey(name: "twoStepEnabled")
  final bool twoStepEnabled;

  /// Create a copy of UserCore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCoreCopyWith<_UserCore> get copyWith =>
      __$UserCoreCopyWithImpl<_UserCore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserCoreToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCore &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.passwordExists, passwordExists) ||
                other.passwordExists == passwordExists) &&
            (identical(other.accountStatus, accountStatus) ||
                other.accountStatus == accountStatus) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.lastLogin, lastLogin) ||
                other.lastLogin == lastLogin) &&
            (identical(other.twoStepEnabled, twoStepEnabled) ||
                other.twoStepEnabled == twoStepEnabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, phoneNumber,
      passwordExists, accountStatus, isActive, lastLogin, twoStepEnabled);

  @override
  String toString() {
    return 'UserCore(id: $id, email: $email, phoneNumber: $phoneNumber, passwordExists: $passwordExists, accountStatus: $accountStatus, isActive: $isActive, lastLogin: $lastLogin, twoStepEnabled: $twoStepEnabled)';
  }
}

/// @nodoc
abstract mixin class _$UserCoreCopyWith<$Res>
    implements $UserCoreCopyWith<$Res> {
  factory _$UserCoreCopyWith(_UserCore value, $Res Function(_UserCore) _then) =
      __$UserCoreCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String id,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phoneNumber") String? phoneNumber,
      @JsonKey(name: "passwordExists") bool passwordExists,
      @JsonKey(name: "accountStatus") String accountStatus,
      @JsonKey(name: "isActive") bool isActive,
      @JsonKey(name: "lastLogin") DateTime lastLogin,
      @JsonKey(name: "twoStepEnabled") bool twoStepEnabled});
}

/// @nodoc
class __$UserCoreCopyWithImpl<$Res> implements _$UserCoreCopyWith<$Res> {
  __$UserCoreCopyWithImpl(this._self, this._then);

  final _UserCore _self;
  final $Res Function(_UserCore) _then;

  /// Create a copy of UserCore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? passwordExists = null,
    Object? accountStatus = null,
    Object? isActive = null,
    Object? lastLogin = null,
    Object? twoStepEnabled = null,
  }) {
    return _then(_UserCore(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordExists: null == passwordExists
          ? _self.passwordExists
          : passwordExists // ignore: cast_nullable_to_non_nullable
              as bool,
      accountStatus: null == accountStatus
          ? _self.accountStatus
          : accountStatus // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      lastLogin: null == lastLogin
          ? _self.lastLogin
          : lastLogin // ignore: cast_nullable_to_non_nullable
              as DateTime,
      twoStepEnabled: null == twoStepEnabled
          ? _self.twoStepEnabled
          : twoStepEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
