import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

class CustomElevatedIconButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry padding;
  final Size minimumSize;

  const CustomElevatedIconButton({
    super.key,
    required this.label,
    required this.icon,
    this.onPressed,
    this.backgroundColor = kColorSchemeSeed,
    this.foregroundColor = kColorWhite,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    this.minimumSize = const Size(0, 36),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: foregroundColor,
            ),
      ),
      icon: Icon(
        icon,
        color: foregroundColor,
      ),
      style: ElevatedButton.styleFrom(
        padding: padding,
        minimumSize: minimumSize,
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor: foregroundColor,
      ),
    );
  }
}
