import 'package:flutter/material.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';

Icon getActionIcon(String action) {
  switch (action) {
    case "REGISTER_WITH_EMAIL":
      return const Icon(Icons.email, color: kColorSchemeSeed, size: 18);
    case "ACCOUNT_RECOVERY":
      return const Icon(Icons.lock_reset, color: kColorSchemeSeed, size: 18);
    case "LOGIN_WITH_EMAIL":
      return const Icon(Icons.login, color: kColorSchemeSeed, size: 18);
    case "CREATE_USER_PROFILE":
      return const Icon(
        Icons.account_circle,
        color: kColorSchemeSeed,
        size: 18,
      );
    case "CREATE_PERSONAL_PROFILE":
      return const Icon(Icons.person, color: kColorSchemeSeed, size: 18);
    case "CREATE_BUSINESS_PROFILE":
      return const Icon(Icons.business, color: kColorSchemeSeed, size: 18);
    case "ADD_TWO_STEP_VERIFICATION":
      return const Icon(Icons.security, color: kColorSchemeSeed, size: 18);
    case "DELETE_TWO_STEP_VERIFICATION":
      return const Icon(
        Icons.security_update_good,
        color: kColorSchemeSeed,
        size: 18,
      );
    case "UPDATE_USER_PROFILE":
      return const Icon(Icons.update, color: kColorSchemeSeed, size: 18);
    default:
      return const Icon(
        Icons.help_outline,
        color: kColorSchemeSeed,
        size: 18,
      ); // Default icon
  }
}
