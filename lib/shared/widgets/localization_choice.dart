import 'package:gcpro/shared/domain/providers/localization_provider.dart';
import 'package:gcpro/shared/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChooseLocalization extends ConsumerWidget {
  const ChooseLocalization({super.key});

  static const Map<String, Locale> supportedLocales = {
    'English': Locale('en'),
    'Amharic': Locale('am'),
    'Afan oromo': Locale('om'),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(localizationProvider);
    return CustomDropDown(
      defaultOption: state.languageCode,
      options: supportedLocales.keys.toList(),
      onChanged: (value) {
        ref.read(localizationProvider.notifier).updateLocale(
              supportedLocales[value] ?? const Locale('en'),
            );
      },
      minWidth: 140,
    );
  }
}
