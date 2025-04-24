import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/settings/presentation/widgets/business_profile/active_business_card.dart';
import 'package:gcpro/features/settings/presentation/widgets/common/section_header.dart';
import 'package:gcpro/features/settings/presentation/widgets/settings_tiles/language_option_tile.dart';
import 'package:gcpro/features/settings/presentation/widgets/settings_tiles/setting_tile_options.dart';
import 'package:gcpro/features/settings/presentation/widgets/settings_tiles/theme_setting_tile.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class SettingMobilleScreen extends StatelessWidget {
  const SettingMobilleScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: kP20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Active Business Profile Card
            const ActiveBusinessProfileCard(),

            const Gap(20),

            // Business Profiles
            SectionHeader(
              title: AppLocalizations.of(context).business_profiles,
            ),
            const BusinessProfilesListTile(),
            const AddBusinessProfileTile(),

            const Gap(20),
            // General Settings
            SectionHeader(title: AppLocalizations.of(context).general_settings),
            const ThemeSettingTile(),
            const LanguageSettingTile(),
            const CurrencySettingTile(),
            const DateFormatSettingTile(),

            const Gap(20),

            // User Preferences
            SectionHeader(title: AppLocalizations.of(context).user_preferences),
            const NotificationSettingTile(),
            const LowStockThresholdSettingTile(),
            const AutoSaveSettingTile(),
            const BackupRestoreSettingTile(),

            const Gap(20),

            // Inventory Management
            SectionHeader(
                title: AppLocalizations.of(context).inventory_management),
            const DefaultSortOrderSettingTile(),
            const BarcodeScannerSettingTile(),
            const BatchEditingSettingTile(),

            const Gap(20),

            // Account & Security
            SectionHeader(title: AppLocalizations.of(context).account_security),
            const UserProfileSettingTile(),
            const ChangePasswordSettingTile(),
            const TwoFactorAuthSettingTile(),
            const LogoutSettingTile(),

            const Gap(20),

            // Integrations & Export
            SectionHeader(
              title: AppLocalizations.of(context).integrations_export,
            ),
            const ExportDataSettingTile(),
            const CloudSyncSettingTile(),
            const POSIntegrationSettingTile(),
            const APIAccessSettingTile(),

            const Gap(20),

            // Support & About
            SectionHeader(title: AppLocalizations.of(context).support_about),
            const HelpCenterSettingTile(),
            const ContactSupportSettingTile(),
            const AppVersionSettingTile(),
            const PrivacyPolicySettingTile(),

            const Gap(30),
          ],
        ),
      ),
    );
  }
}
