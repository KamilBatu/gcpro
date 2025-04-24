import 'package:gcpro/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrSplitter extends StatelessWidget {
  const OrSplitter({
    super.key,
    this.vertical = 0,
  });

  final double vertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28, vertical: vertical),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 2,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          const Gap(10),
          Text(
            AppLocalizations.of(context).or,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Gap(10),
          Expanded(
            child: Container(
              height: 2,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
        ],
      ),
    );
  }
}
