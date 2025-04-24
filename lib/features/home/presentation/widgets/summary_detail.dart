import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/home/presentation/providers/home_provider.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/shared/mixins/localization_helper.dart';
import 'package:gcpro/shared/widgets/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class SummaryGrid extends ConsumerWidget {
  const SummaryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryItems = ref.watch(summaryDistribution);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context).summary,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return CustomDropDown(
                    defaultOption: "today",
                    options: const [
                      "today",
                      "this_week",
                      "this_month",
                      "this_year",
                    ],
                    onChanged: (value) {
                      ref
                          .read(summaryDurationDistribution.notifier)
                          .update((_) => value);
                    },
                    minWidth: 80,
                  );
                },
              ),
            ],
          ),
          const Gap(16),

          // Summary Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.85,
            ),
            itemCount: summaryItems.length,
            itemBuilder: (context, index) {
              return SummaryCard(
                value: summaryItems[index]['value']!,
                label: summaryItems[index]['label']!,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  const SummaryCard({required this.value, required this.label, super.key});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kColorSchemeSeed.withAlpha(40),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(4),
          Text(
            AppLocalizations.of(context).getSummaryLable(label) ?? label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: kColorSchemeSeed,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
