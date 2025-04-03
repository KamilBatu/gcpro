import 'dart:io';

import 'package:flutter/material.dart';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const int PRODUCTS_PER_PAGE = 20;
const int SNACK_BAR_DURATION = 2000;
const String FIRST_TIME_KEY = "first_time";
const ColorFilter invert = ColorFilter.matrix(<double>[
  -1,
  0,
  0,
  0,
  255,
  0,
  -1,
  0,
  0,
  255,
  0,
  0,
  -1,
  0,
  255,
  0,
  0,
  0,
  1,
  0,
]);
const ColorFilter normal = ColorFilter.matrix(<double>[
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
  0,
  0,
  0,
  0,
  1,
  0,
]);

// Password requirements
const String uppercase = r"(?=\.*[A-Z])";
const String lowercase = r"(?=\.*[a-z])";
const String digit = r"(?=\.*\d)";
const String special = r"(?=\.*[\!@#$%^&*()_+\-=\[\]{};':\\|,\.<>\/?])";

String? Function(String?) passwordValidator(
  void Function(String error) addError,
  void Function(String error) removeError,
) {
  return (String? value) {
    if (value == null || value.isEmpty) {
      addError("Password cannot be empty.");
      return "";
    } else {
      removeError("Password cannot be empty.");
    }

    if (value.length < 8) {
      addError("Password must be at least 8 characters long.");
      return "";
    } else {
      removeError("Password must be at least 8 characters long.");
    }

    if (value.length > 50) {
      addError("Password must not exceed 50 characters.");
      return "";
    } else {
      removeError("Password must not exceed 50 characters.");
    }

    final uppercase = RegExp('[A-Z]');
    final lowercase = RegExp('[a-z]');
    final digit = RegExp('[0-9]');
    final special = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

    if (!uppercase.hasMatch(value)) {
      addError("Password must contain at least one uppercase letter.");
      return "";
    } else {
      removeError("Password must contain at least one uppercase letter.");
    }

    if (!lowercase.hasMatch(value)) {
      addError("Password must contain at least one lowercase letter.");
      return "";
    } else {
      removeError("Password must contain at least one lowercase letter.");
    }

    if (!digit.hasMatch(value)) {
      addError("Password must contain at least one digit.");
      return "";
    } else {
      removeError("Password must contain at least one digit.");
    }

    if (!special.hasMatch(value)) {
      addError("Password must contain at least one special character.");
      return "";
    } else {
      removeError("Password must contain at least one special character.");
    }

    return null; // No errors, password is valid
  };
}

enum SuccessState {
  otpSent,
  otpResended,
  otpVerified,
  userRegistered,
  userProfileRegistered,
  passwordChanged,
  userLoggedIn,
  userLoggedOut
}

const placeholderImage = "https://fakeimg.pl/600x400";
const fileServerHost = "api.sefer.hopeuptech.com";

enum OTPType {
  ACCOUNT_RECOVERY,
  ACCOUNT_VERIFICATION,
  TWO_FACTOR_AUTHENTICATION
}

enum TwoFactorMethodType { AUTHENTICATOR, PASSKEYS, EMAIL, PHONE }

enum ScreenType { Mobile, Tablet, Desktop }
