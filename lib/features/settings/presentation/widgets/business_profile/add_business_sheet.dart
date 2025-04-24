import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddBusinessProfileSheet extends StatelessWidget {
  const AddBusinessProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPh20v10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).add_new_business,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: kColorSchemeSeed,
                ),
          ),
          const Gap(24),
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).business_name,
              border: const OutlineInputBorder(),
            ),
          ),
          const Gap(16),
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).business_type,
              border: const OutlineInputBorder(),
            ),
          ),
          const Gap(16),
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).address,
              border: const OutlineInputBorder(),
            ),
          ),
          const Gap(16),
          TextField(
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).contact_number,
              border: const OutlineInputBorder(),
            ),
          ),
          const Gap(24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                // Create new business profile
                Navigator.pop(context);
              },
              child: const Text('Create Business'),
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
