// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_core.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserCore _$UserCoreFromJson(Map<String, dynamic> json) => _UserCore(
      id: json['id'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      passwordExists: json['passwordExists'] as bool,
      accountStatus: json['accountStatus'] as String,
      isActive: json['isActive'] as bool,
      lastLogin: DateTime.parse(json['lastLogin'] as String),
      twoStepEnabled: json['twoStepEnabled'] as bool,
    );

Map<String, dynamic> _$UserCoreToJson(_UserCore instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'passwordExists': instance.passwordExists,
      'accountStatus': instance.accountStatus,
      'isActive': instance.isActive,
      'lastLogin': instance.lastLogin.toIso8601String(),
      'twoStepEnabled': instance.twoStepEnabled,
    };
