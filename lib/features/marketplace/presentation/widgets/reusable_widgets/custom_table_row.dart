// resuable table row component
import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

TableRow CustomTableRow(
    {required BuildContext context,
    required String label,
    required String ratingValue}) {
  return TableRow(
    children: [
      Text(
        label,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: kColorBlack50),
      ),
      Text(
        ratingValue,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    ],
  );
}
