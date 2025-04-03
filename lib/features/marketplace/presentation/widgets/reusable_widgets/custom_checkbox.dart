import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final VoidCallback onChanged;
  final String label;
  final bool isCircular;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        isCircular
            ? Checkbox(
                value: value,
                onChanged: (newValue) => onChanged(),
                shape: const CircleBorder(),
              )
            : Checkbox(
                value: value,
                onChanged: (newValue) => onChanged(),
              ),
        Text(label),
      ],
    );
  }
}
