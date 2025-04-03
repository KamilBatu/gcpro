import '../tokens/colors.dart';
import 'loading_spinner.dart';
import 'package:flutter/material.dart';

class BFilledButton extends StatelessWidget {
  const BFilledButton({
    required this.isLoading,
    required this.text,
    super.key,
    this.onPressed,
    this.textColor,
    this.radius,
    this.padding,
    this.icon = const [],
    this.color,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final double? radius;
  final Color? color;
  final Color? textColor;
  final List<Widget> icon;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding ?? 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? kColorSchemeSeed,
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 50),
            ),
          ),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...icon,
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: !isLoading
                          ? textColor ?? Colors.white
                          : Colors.transparent,
                    ),
                  ),
                ],
              ),
              if (isLoading)
                LoadingSpinner(
                  size: 26,
                  color: Theme.of(context).colorScheme.surface,
                )
              else
                const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
