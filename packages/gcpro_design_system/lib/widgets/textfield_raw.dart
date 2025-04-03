import '../gcpro_design_sysytem.dart';
import 'package:flutter/material.dart';

class BRawTextField extends StatelessWidget {
  const BRawTextField({
    super.key,
    this.onChanged,
    this.controller,
    this.hintText,
    this.style,
    this.readOnly = false,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? style;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: readOnly,
      controller: controller,
      onChanged: onChanged,
      style: style,
      decoration: InputDecoration(
        isDense: true,
        border: InputBorder.none,
        hintText: hintText,
        contentPadding: kPv8,
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
