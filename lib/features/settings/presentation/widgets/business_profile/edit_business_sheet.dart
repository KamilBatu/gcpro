import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/shared/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditBusinessProfileSheet extends StatelessWidget {
  const EditBusinessProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPh20v15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).edit_business_profile,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: kColorSchemeSeed,
                ),
          ),
          const Gap(24),
          CustomTextField(
            hintText: AppLocalizations.of(context).business_name,
            lableText: AppLocalizations.of(context).business_name,
            controller: TextEditingController(),
            suffixIcon: const Icon(
              Icons.edit,
              size: kIconSizeSmall,
            ),
          ),
          const Gap(16),
          CustomTextField(
            hintText: AppLocalizations.of(context).business_type,
            lableText: AppLocalizations.of(context).business_type,
            controller: TextEditingController(),
            suffixIcon: const Icon(
              Icons.edit,
              size: kIconSizeSmall,
            ),
          ),
          const Gap(16),
          CustomTextField(
            hintText: AppLocalizations.of(context).address,
            lableText: AppLocalizations.of(context).address,
            controller: TextEditingController(),
            suffixIcon: const Icon(
              Icons.edit,
              size: kIconSizeSmall,
            ),
          ),
          const Gap(16),
          CustomTextField(
            hintText: AppLocalizations.of(context).contact_number,
            lableText: AppLocalizations.of(context).contact_number,
            controller: TextEditingController(),
            suffixIcon: const Icon(
              Icons.edit,
              size: kIconSizeSmall,
            ),
          ),
          const Gap(32),
          BFilledButton(
            isLoading: false,
            padding: 0,
            text: AppLocalizations.of(context).save_changes,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
