import 'package:gcpro_design_system/tokens/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final bool isCircular;
  final EdgeInsets padding;
  final Size minimumSize;
  final Color? backgroundColor; // Added background color field
  final Color? labelColor; // Added background color field

  final double cornerRadius; // Added corner radius field

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isCircular = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.minimumSize = const Size(0, 40),
    this.backgroundColor = kColorSchemeSeed,
    this.labelColor = kColorWhite,
    this.cornerRadius = 25.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: padding,
        minimumSize: minimumSize,
        backgroundColor: backgroundColor, // Apply background color

        shape: isCircular
            ? const CircleBorder()
            : RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(cornerRadius), // Apply corner radius
              ),
      ),
      child: Text(
        label,
        style: TextStyle(color: labelColor),
      ),
    );
  }
}
