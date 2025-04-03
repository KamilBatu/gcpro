import 'package:gcpro/l10n/app_localizations.dart';
import 'package:gcpro/shared/domain/providers/localization_provider.dart';
import 'package:gcpro/shared/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseLocalization extends ConsumerWidget {
  const ChooseLocalization({super.key});

  static const Map<String, String> supportedLocales = {
    'en': 'English',
    'am': 'Amharic',
    'om': 'Afan Oromo',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(localizationProvider);
    return CustomDropDown(
      defaultOption: supportedLocales[state.languageCode] ?? 'English',
      options: AppLocalizations.supportedLocales
          .map((locale) => supportedLocales[locale.languageCode]!)
          .toList(),
      onChanged: (value) {
        ref.read(localizationProvider.notifier).updateLocale(
              AppLocalizations.supportedLocales.firstWhere(
                (entry) => supportedLocales[entry.languageCode] == value,
                orElse: () => const Locale('en'),
              ),
            );
      },
      minWidth: 80,
    );
  }
}
