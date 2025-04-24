import 'package:gcpro/features/settings/presentation/widgets/business_profile/add_business_sheet.dart';
import 'package:gcpro/features/settings/presentation/widgets/business_profile/business_profile_sheet.dart';
import 'package:gcpro/features/settings/presentation/widgets/common/setting_tile.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
import 'package:flutter/material.dart';

// Currency Setting
class CurrencySettingTile extends StatelessWidget {
  const CurrencySettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.attach_money,
      iconText: '💰',
      title: AppLocalizations.of(context).currency,
      subtitle: 'ETB (Ethiopian Birr)'.hardcoded,
      onTap: () {
        // Show currency selection dialog
      },
    );
  }
}

// Date Format Setting
class DateFormatSettingTile extends StatelessWidget {
  const DateFormatSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.calendar_today,
      iconText: '📅',
      title: AppLocalizations.of(context).date_format,
      subtitle: AppLocalizations.of(context).dd_mm_yyyy,
      onTap: () {
        // Show date format selection dialog
      },
    );
  }
}

// Notification Setting
class NotificationSettingTile extends StatelessWidget {
  const NotificationSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.notifications,
      iconText: '🔔',
      title: AppLocalizations.of(context).notifications,
      subtitle: AppLocalizations.of(context).enabled,
      onTap: () {
        // Show notification settings dialog
      },
    );
  }
}

// Low Stock Threshold Setting
class LowStockThresholdSettingTile extends StatelessWidget {
  const LowStockThresholdSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.inventory,
      iconText: '📉',
      title: AppLocalizations.of(context).low_stock_threshold,
      subtitle: '10 items'.hardcoded,
      onTap: () {
        // Show low stock threshold settings dialog
      },
    );
  }
}

// Auto Save Setting
class AutoSaveSettingTile extends StatelessWidget {
  const AutoSaveSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.save,
      iconText: '💾',
      title: AppLocalizations.of(context).auto_save_changes,
      subtitle: AppLocalizations.of(context).enabled,
      onTap: () {
        // Show auto-save settings dialog
      },
    );
  }
}

// Backup & Restore Setting
class BackupRestoreSettingTile extends StatelessWidget {
  const BackupRestoreSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.backup,
      iconText: '☁️',
      title: AppLocalizations.of(context).backup_restore,
      subtitle: AppLocalizations.of(context).last_backup_never,
      onTap: () {
        // Show backup & restore dialog
      },
    );
  }
}

// Default Sort Order Setting
class DefaultSortOrderSettingTile extends StatelessWidget {
  const DefaultSortOrderSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.sort,
      iconText: '📦',
      title: AppLocalizations.of(context).default_sort_order,
      subtitle: AppLocalizations.of(context).by_name,
      onTap: () {
        // Show sort order dialog
      },
    );
  }
}

// Barcode Scanner Setting
class BarcodeScannerSettingTile extends StatelessWidget {
  const BarcodeScannerSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.qr_code_scanner,
      iconText: '📷',
      title: AppLocalizations.of(context).barcode_scanner,
      subtitle: AppLocalizations.of(context).enabled,
      onTap: () {
        // Show barcode scanner settings dialog
      },
    );
  }
}

// Batch Editing Setting
class BatchEditingSettingTile extends StatelessWidget {
  const BatchEditingSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.edit,
      iconText: '✏️',
      title: AppLocalizations.of(context).batch_editing,
      subtitle: AppLocalizations.of(context).enabled,
      onTap: () {
        // Show batch editing settings dialog
      },
    );
  }
}

// User Profile Setting
class UserProfileSettingTile extends StatelessWidget {
  const UserProfileSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.person,
      iconText: '👤',
      title: AppLocalizations.of(context).user_profile,
      subtitle: AppLocalizations.of(context).view_and_edit_your_profile,
      onTap: () {
        // Navigate to user profile screen
      },
    );
  }
}

// Change Password Setting
class ChangePasswordSettingTile extends StatelessWidget {
  const ChangePasswordSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.lock,
      iconText: '🔑',
      title: AppLocalizations.of(context).change_password,
      subtitle: AppLocalizations.of(context).update_your_login_credentials,
      onTap: () {
        // Show change password dialog
      },
    );
  }
}

// Two-Factor Authentication Setting
class TwoFactorAuthSettingTile extends StatelessWidget {
  const TwoFactorAuthSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.security,
      iconText: '🛡️',
      title: AppLocalizations.of(context).two_factor_authentication,
      subtitle: AppLocalizations.of(context).disabled,
      onTap: () {
        // Show 2FA settings dialog
      },
    );
  }
}

// Logout Setting
class LogoutSettingTile extends StatelessWidget {
  const LogoutSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.logout,
      iconText: '🚪',
      title: AppLocalizations.of(context).logout,
      subtitle: AppLocalizations.of(context).sign_out_of_your_account,
      onTap: () {
        // Show logout confirmation dialog
      },
    );
  }
}

// Export Data Setting
class ExportDataSettingTile extends StatelessWidget {
  const ExportDataSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.file_download,
      iconText: '📊',
      title: AppLocalizations.of(context).export_data,
      subtitle: AppLocalizations.of(context).csv_excel_or_pdf,
      onTap: () {
        // Show export data dialog
      },
    );
  }
}

// Cloud Sync Setting
class CloudSyncSettingTile extends StatelessWidget {
  const CloudSyncSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.cloud_sync,
      iconText: '☁️',
      title: AppLocalizations.of(context).cloud_sync,
      subtitle: AppLocalizations.of(context).not_connected,
      onTap: () {
        // Show cloud sync dialog
      },
    );
  }
}

// POS Integration Setting
class POSIntegrationSettingTile extends StatelessWidget {
  const POSIntegrationSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.point_of_sale,
      iconText: '🏪',
      title: AppLocalizations.of(context).pos_integration,
      subtitle: AppLocalizations.of(context).not_connected,
      onTap: () {
        // Show POS integration dialog
      },
    );
  }
}

// API Access Setting
class APIAccessSettingTile extends StatelessWidget {
  const APIAccessSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.api,
      iconText: '🔌',
      title: AppLocalizations.of(context).api_access,
      subtitle: AppLocalizations.of(context).disabled,
      onTap: () {
        // Show API access dialog
      },
    );
  }
}

// Help Center Setting
class HelpCenterSettingTile extends StatelessWidget {
  const HelpCenterSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.help,
      iconText: '📖',
      title: AppLocalizations.of(context).help_center,
      subtitle: AppLocalizations.of(context).faqs_tutorials,
      onTap: () {
        // Navigate to help center
      },
    );
  }
}

// Contact Support Setting
class ContactSupportSettingTile extends StatelessWidget {
  const ContactSupportSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.contact_support,
      iconText: '✉️',
      title: AppLocalizations.of(context).contact_support,
      subtitle: AppLocalizations.of(context).email_live_chat_or_phone,
      onTap: () {
        // Show contact support dialog
      },
    );
  }
}

// App Version Setting
class AppVersionSettingTile extends StatelessWidget {
  const AppVersionSettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.info,
      iconText: 'ℹ️',
      title: AppLocalizations.of(context).app_version,
      subtitle: '1.0.0'.hardcoded,
      onTap: () {
        // Show app version details
      },
    );
  }
}

// Privacy Policy Setting
class PrivacyPolicySettingTile extends StatelessWidget {
  const PrivacyPolicySettingTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.privacy_tip,
      iconText: '📜',
      title: AppLocalizations.of(context).privacy_policy_terms,
      subtitle: AppLocalizations.of(context).view_legal_documents,
      onTap: () {
        // Navigate to privacy policy
      },
    );
  }
}

class AddBusinessProfileTile extends StatelessWidget {
  const AddBusinessProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.add_business,
      iconText: '➕',
      title: AppLocalizations.of(context).add_new_business,
      subtitle: AppLocalizations.of(context).create_a_new_business_profile,
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) => const AddBusinessProfileSheet(),
        );
      },
    );
  }
}

class BusinessProfilesListTile extends StatelessWidget {
  const BusinessProfilesListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingTile(
      icon: Icons.business,
      iconText: '🏢',
      title: AppLocalizations.of(context).switch_business,
      subtitle: '3${AppLocalizations.of(context).businesses_available}',
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          builder: (context) => const BusinessProfilesSheet(),
        );
      },
    );
  }
}
