import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/shared/globals.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({
    required this.controller,
    required this.addError,
    required this.removeError,
    this.onSaved,
    super.key,
    this.height = 20,
    this.disabled = false,
    this.lableText,
    this.hintText,
  });
  final double height;
  final bool disabled;
  final void Function(String) addError;
  final void Function(String) removeError;
  final VoidCallback? onSaved;
  final TextEditingController controller;
  final String? hintText;
  final String? lableText;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lableText ?? "Password",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
        ),
        const Gap(12),
        TextFormField(
          key: widget.key,
          controller: widget.controller,
          validator: passwordValidator(widget.addError, widget.removeError),
          onChanged: passwordValidator(widget.addError, widget.removeError),
          onFieldSubmitted: (value) => widget.onSaved?.call(),
          obscureText: _obscureText,
          enabled: !widget.disabled,
          decoration: InputDecoration(
            hintText: widget.hintText ??
                AppLocalizations.of(context).pleaseEnterYourCredentials,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            errorStyle: const TextStyle(
              color: Colors.red,
              fontSize: 10,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 22,
              vertical: widget.height,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: kColorSchemeSeed,
                  size: 12,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
                style: BorderStyle.none,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(50)),
            ),
          ),
        ),
      ],
    );
  }
}
