import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:gcpro_design_system/tokens/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.lableText,
    required this.controller,
    required this.suffixIcon,
    super.key,
    this.validator,
    this.date = false,
    this.number = false,
    this.country = false,
    this.height = 20,
    this.prefix,
    this.disabled = false,
    this.onChanged,
  });
  final String hintText;
  final bool date;
  final bool country;
  final bool disabled;
  final bool number;
  final String lableText;
  final Widget? prefix;
  final double height;
  final Widget suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lableText == "")
          const SizedBox()
        else
          Text(
            lableText,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
          ),
        if (lableText == "") const SizedBox() else const Gap(12),
        if (date | country)
          GestureDetector(
            onTap: date
                ? () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(2011 - 200),
                      lastDate: DateTime(2011),
                    );
                    if (picked != null) {
                      controller.text = picked.toString().split(' ').first;
                    }
                  }
                : () {
                    showCountryPicker(
                      context: context,
                      countryListTheme: CountryListThemeData(
                        flagSize: 25,
                        backgroundColor: Theme.of(context).colorScheme.surface,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                        ),
                        bottomSheetHeight: 500,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        inputDecoration: InputDecoration(
                          labelText: 'Search',
                          hintText: 'Start typing to search',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color(0xFF8C98A8)
                                  .withValues(alpha: 0.2),
                            ),
                          ),
                        ),
                      ),
                      onSelect: (Country country) =>
                          controller.text = country.name,
                    );
                  },
            child: AbsorbPointer(
              child: TextFormField(
                controller: controller,
                validator: validator,
                enabled: !disabled,
                onChanged: onChanged,
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  hintText: hintText,
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
                    vertical: height,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: suffixIcon,
                  ),
                  suffixIconColor: kColorSchemeSeed,
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
            ),
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefix ?? const SizedBox(width: 0),
              Expanded(
                child: TextFormField(
                  key: key,
                  controller: controller,
                  validator: validator,
                  enabled: !disabled,
                  onChanged: onChanged,
                  keyboardType: number ? TextInputType.number : null,
                  style: const TextStyle(fontSize: 12),
                  decoration: InputDecoration(
                    hintText: hintText,
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
                      vertical: height,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: suffixIcon,
                    ),
                    suffixIconColor: kColorSchemeSeed,
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
              ),
            ],
          ),
      ],
    );
  }
}
