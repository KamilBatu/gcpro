import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/settings/presentation/widgets/business_profile/business_profile_stats.dart';
import 'package:gcpro/features/settings/presentation/widgets/business_profile/edit_business_sheet.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ActiveBusinessProfileCard extends ConsumerWidget {
  const ActiveBusinessProfileCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: kP16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Icon(Icons.store, size: 30),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context).current_business,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                      const Gap(4),
                      Text(
                        AppLocalizations.of(context).my_pharmacy_store,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit,
                    size: kIconSizeSmall,
                  ),
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      isScrollControlled: true,
                      showDragHandle: true,
                      builder: (context) => const EditBusinessProfileSheet(),
                    );
                  },
                ),
              ],
            ),
            const Gap(16),
            const BusinessProfileStats(),
          ],
        ),
      ),
    );
  }
}
