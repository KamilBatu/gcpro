import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/settings/presentation/screens/settings_mobile_screen.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/shared/utils/responsive/screen_type_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});
  static const routeName = '/settingsScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).settings,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: const ScreenTypeLayout(
        mobile: SettingMobilleScreen(),
        tablet: SettingMobilleScreen(),
        desktop: SettingMobilleScreen(),
      ),
    );
  }
}
