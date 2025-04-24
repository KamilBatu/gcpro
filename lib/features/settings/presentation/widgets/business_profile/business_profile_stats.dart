import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:flutter/material.dart';

class BusinessProfileStats extends StatelessWidget {
  const BusinessProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatItem(context, AppLocalizations.of(context).products, '156'),
        _buildStatItem(context, AppLocalizations.of(context).orders, '1.2K'),
        _buildStatItem(
          context,
          AppLocalizations.of(context).revenue,
          '45K ${AppLocalizations.of(context).etb}',
        ),
      ],
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: kColorSchemeSeed,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}
