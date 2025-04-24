import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BusinessProfilesSheet extends StatelessWidget {
  const BusinessProfilesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPh20,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).switch_business,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: kColorSchemeSeed,
                ),
          ),
          const Gap(16),
          ListView(
            shrinkWrap: true,
            children: [
              _buildBusinessItem(
                context,
                'My Pharmacy Store',
                'Active',
                true,
              ),
              _buildBusinessItem(
                context,
                'Medical Supplies Store',
                'Owner',
                false,
              ),
              _buildBusinessItem(
                context,
                'City Pharmacy',
                'Manager',
                false,
              ),
            ],
          ),
          const Gap(16),
        ],
      ),
    );
  }

  Widget _buildBusinessItem(
    BuildContext context,
    String name,
    String role,
    bool isActive,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Icon(Icons.store),
      ),
      title: Text(name),
      subtitle: Text(role),
      trailing: isActive
          ? const Icon(
              Icons.check_circle,
              color: kColorSchemeSeed,
            )
          : null,
      onTap: () {
        // Switch to this business profile
        Navigator.pop(context);
      },
    );
  }
}
