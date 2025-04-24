import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// Action button widget for quick actions
class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: kBorderRadius20,
      child: Container(
        padding: kPh20v10,
        decoration: BoxDecoration(
          color: kColorSchemeSeed.withAlpha(40),
          borderRadius: kBorderRadius20,
        ),
        child: Row(
          children: [
            Icon(icon, size: 16),
            const Gap(8),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 70),
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
