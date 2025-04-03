import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_core.freezed.dart';
part 'user_core.g.dart';

@freezed
abstract class UserCore with _$UserCore {
  const factory UserCore({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "email") required String? email,
    @JsonKey(name: "phoneNumber") required String? phoneNumber,
    @JsonKey(name: "passwordExists") required bool passwordExists,
    @JsonKey(name: "accountStatus") required String accountStatus,
    @JsonKey(name: "isActive") required bool isActive,
    @JsonKey(name: "lastLogin") required DateTime lastLogin,
    @JsonKey(name: "twoStepEnabled") required bool twoStepEnabled,
  }) = _UserCore;

  factory UserCore.fromJson(Map<String, dynamic> json) =>
      _$UserCoreFromJson(json);
}
