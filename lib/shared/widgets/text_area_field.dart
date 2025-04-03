import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextAreaField extends StatelessWidget {
  const TextAreaField({
    required this.lableText, required this.controller, super.key,
    this.validator,
  });

  final String lableText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lableText, style: Theme.of(context).textTheme.displaySmall),
        const Gap(12),
        TextFormField(
          controller: controller,
          maxLines: 5,
          validator: validator,
          decoration: InputDecoration(
              hintText: "Enter your $lableText",
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w300),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).colorScheme.surfaceTint),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),),
              border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary, width: 2, style: BorderStyle.none),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),),),
        ),
      ],
    );
  }
}
