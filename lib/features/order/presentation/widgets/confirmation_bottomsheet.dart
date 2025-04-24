import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Future<void> showConfirmationBottomSheet(BuildContext context) async {
  await showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: kTopBorderRadius,
    ),
    builder: (context) {
      return const ConfirmationBottomSheet();
    },
  );
}

class ConfirmationBottomSheet extends StatelessWidget {
  const ConfirmationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPh20v15,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(24),
          // Success Icon
          CircleAvatar(
            radius: 48,
            backgroundColor: Theme.of(context).colorScheme.surfaceDim,
            child: Icon(
              Icons.check,
              size: 36,
              color: Theme.of(context).colorScheme.surfaceBright,
            ),
          ),

          const Gap(24),

          // Title Placeholder
          Container(
            height: 24,
            width: 120,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(8),
            ),
          ),

          const Gap(32),

          // Description Placeholder
          Container(
            height: 16,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const Gap(16),
          Container(
            height: 16,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceDim,
              borderRadius: BorderRadius.circular(6),
            ),
          ),

          const Gap(64),

          // Buttons Row
          Row(
            children: [
              // Share Button
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(AppLocalizations.of(context).share),
                ),
              ),

              const Gap(24),

              // Go to Home Button
              Expanded(
                child: BFilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: AppLocalizations.of(context).go_back,
                  isLoading: false,
                  padding: 0,
                ),
              ),
            ],
          ),

          const Gap(24),
        ],
      ),
    );
  }
}
