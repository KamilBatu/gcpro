import 'package:flutter/material.dart';

class CustomButtonTest extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButtonTest({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }
}
