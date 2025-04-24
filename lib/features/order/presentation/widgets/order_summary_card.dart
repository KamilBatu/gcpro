import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({required this.value, required this.label, super.key});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kP20,
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
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const Gap(8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: kColorSchemeSeed,
            ),
          ),
        ],
      ),
    );
  }
}
