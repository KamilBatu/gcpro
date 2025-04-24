import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/settings/presentation/widgets/common/setting_tile.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
import 'package:gcpro/shared/domain/providers/localization_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Language Setting
class LanguageSettingTile extends ConsumerWidget {
  const LanguageSettingTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localizationProvider);

    return SettingTile(
      icon: Icons.language,
      iconText: '🌍',
      title: 'Language'.hardcoded,
      subtitle: locale.languageCode,
      onTap: () {
        _showLanguageBottomSheet(context, ref);
      },
    );
  }

  void _showLanguageBottomSheet(BuildContext context, WidgetRef ref) {
    final currentLanguage = ref.watch(localizationProvider).languageCode;

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
                  'Select Theme',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: kColorSchemeSeed,
                      ),
                ),
              ),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: [
                  _buildLanguageOption(
                    context,
                    ref,
                    title: 'English',
                    currentLanguage: currentLanguage,
                    icon: Icons.language,
                  ),
                  _buildLanguageOption(
                    context,
                    ref,
                    title: 'Amharic',
                    currentLanguage: currentLanguage,
                    icon: Icons.language,
                  ),
                  _buildLanguageOption(
                    context,
                    ref,
                    title: 'Afan gcpro_design_system',
                    currentLanguage: currentLanguage,
                    icon: Icons.language,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(
    BuildContext context,
    WidgetRef ref, {
    required String title,
    required String currentLanguage,
    required IconData icon,
  }) {
    final isSelected = currentLanguage ==
        {
          'English': 'en',
          'Amharic': 'am',
          'Afan gcpro_design_system': 'om',
        }[title];

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
        ref.read(localizationProvider.notifier).updateLocale(
              {
                'English': const Locale('en'),
                'Amharic': const Locale('am'),
                'Afan gcpro_design_system': const Locale('om'),
              }[title]!,
            );
        Navigator.pop(context);
      },
    );
  }
}
