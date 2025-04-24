import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/settings/presentation/widgets/common/setting_tile.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
import 'package:gcpro/shared/domain/providers/theme_provider.dart' hide Theme;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeSettingTile extends ConsumerWidget {
  const ThemeSettingTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider.notifier).isDark();
    final currentTheme = isDark
        ? AppLocalizations.of(context).dark
        : AppLocalizations.of(context).light;

    return SettingTile(
      icon: Icons.brightness_6,
      iconText: '🌗',
      title: 'Theme'.hardcoded,
      subtitle: currentTheme,
      onTap: () => _showThemeBottomSheet(context, ref),
    );
  }

  void _showThemeBottomSheet(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider.notifier).isDark();
    final currentTheme = isDark ? ThemeMode.dark : ThemeMode.light;

    showModalBottomSheet<void>(
      context: context,
      useRootNavigator: true,
      constraints: const BoxConstraints(maxHeight: 500),
      builder: (context) {
        return Container(
          margin: const EdgeInsets.only(top: 20, bottom: 15),
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                child: Text(
                  AppLocalizations.of(context).select_theme,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: kColorSchemeSeed,
                      ),
                ),
              ),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  _buildThemeOption(
                    context,
                    ref,
                    title: AppLocalizations.of(context).light,
                    mode: ThemeMode.light,
                    currentTheme: currentTheme,
                    icon: Icons.light_mode,
                  ),
                  _buildThemeOption(
                    context,
                    ref,
                    title: AppLocalizations.of(context).dark,
                    mode: ThemeMode.dark,
                    currentTheme: currentTheme,
                    icon: Icons.dark_mode,
                  ),
                  _buildThemeOption(
                    context,
                    ref,
                    title: AppLocalizations.of(context).system_default,
                    mode: ThemeMode.system,
                    currentTheme: currentTheme,
                    icon: Icons.settings_suggest,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildThemeOption(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required ThemeMode mode,
    required ThemeMode currentTheme,
    required IconData icon,
  }) {
    final isSelected = currentTheme == mode;

    return ListTile(
      dense: true,
      selectedTileColor: kColorSchemeSeed.withAlpha(15),
      selected: isSelected,
      visualDensity: const VisualDensity(
        vertical: VisualDensity.minimumDensity,
        horizontal: VisualDensity.minimumDensity,
      ),
      leading: Icon(
        icon,
        size: 20,
        color: isSelected ? kColorSchemeSeed : null,
      ),
      trailing: isSelected
          ? const Icon(
              Icons.check_circle_outline_rounded,
              size: 18,
              color: kColorSchemeSeed,
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      onTap: () {
        ref.read(themeProvider.notifier).changeTheme(mode);
        Navigator.pop(context);
      },
    );
  }
}
