import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:gcpro/l10n/app_localizations.dart';
import 'package:gcpro/shared/domain/providers/username_type_provider.dart';
import 'package:gcpro/shared/widgets/text_field.dart';

class UsernameTextField extends ConsumerWidget {
  const UsernameTextField({
    required this.controller,
    required this.addError,
    required this.removeError,
    super.key,
    this.disabled = false,
  });

  final TextEditingController controller;
  final void Function(String) addError;
  final void Function(String) removeError;
  final bool disabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameType = ref.watch(usernameTypeProvider);

    String? validateUsername(String? value) {
      // Debug print to confirm input
      print('Validating input: "$value"');

      if (value == null || value.isEmpty) {
        addError("${usernameType.name} cannot be empty.");
        return "Field cannot be empty.";
      } else {
        removeError("${usernameType.name} cannot be empty.");
      }

      if (usernameType == UsernameType.email) {
        final emailRegex =
            RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
        if (!emailRegex.hasMatch(value)) {
          addError("Invalid email address.");
          return "Invalid email format.";
        } else {
          removeError("Invalid email address.");
        }
      } else if (usernameType == UsernameType.phone) {
        // Strip country code if present (e.g., +251)
        String phoneValue = value.replaceAll(RegExp(r'^\+\d+'), '');
        print('Stripped phone value: "$phoneValue"');

        // Regex for 9 digits starting with 7 or 9
        final phoneRegex = RegExp(r"^[79]\d{8}$");
        if (!phoneRegex.hasMatch(phoneValue)) {
          removeError("Invalid email address."); // Clean up unrelated error
          addError(
              "Invalid phone number. Must start with 9 or 7 and be 9 digits.");
          return "Invalid phone number.";
        } else {
          removeError(
              "Invalid phone number. Must start with 9 or 7 and be 9 digits.");
        }
      }

      // Minimum length check (optional, keeping it for consistency)
      if (value.length < 3) {
        addError("Username must be at least 3 characters long.");
        return "Too short.";
      } else {
        removeError("Username must be at least 3 characters long.");
      }

      return null;
    }

    ref.listen(usernameTypeProvider, (_, __) => controller.clear());

    return SizedBox(
      height: 105,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ChooseUsernameType(
            phoneNumber: usernameType,
            removeError: removeError,
          ),
          const Gap(12),
          CustomTextField(
            hintText: usernameType == UsernameType.email
                ? AppLocalizations.of(context)!.enterYourEmailAddress
                : AppLocalizations.of(context)!.enterYourPhoneNumber +
                    " (e.g., 914053340)",
            lableText: "",
            height: 5,
            controller: controller,
            disabled: disabled,
            prefix: usernameType == UsernameType.phone
                ? CountryCodePicker(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    dialogBackgroundColor:
                        Theme.of(context).colorScheme.surface,
                    barrierColor: Theme.of(context).colorScheme.surface,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    initialSelection: 'ET',
                    favorite: const ['+251', 'ET'],
                    showFlagDialog: true,
                    showFlag: false,
                    onChanged: (code) {
                      // Optional: Update controller if needed, but we'll validate without it
                      print('Country code selected: ${code.dialCode}');
                    },
                  )
                : null,
            suffixIcon: Icon(
              usernameType == UsernameType.email ? Icons.email : Icons.phone,
              size: 15,
            ),
            validator: validateUsername,
            obscureText: false,
          ),
        ],
      ),
    );
  }
}

class ChooseUsernameType extends ConsumerWidget {
  const ChooseUsernameType({
    required this.phoneNumber,
    required this.removeError,
    super.key,
  });

  final UsernameType phoneNumber;
  final void Function(String) removeError;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 110,
      child: DefaultTabController(
        length: 2,
        child: TabBar(
          padding: EdgeInsets.zero,
          labelPadding: const EdgeInsets.only(right: 12),
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.onSurface,
          unselectedLabelColor: Theme.of(context).colorScheme.onSurfaceVariant,
          labelStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
          tabs: [
            Tab(height: 22, text: AppLocalizations.of(context)!.email),
            Tab(height: 22, text: AppLocalizations.of(context)!.phoneNumber),
          ],
          onTap: (index) {
            final usernameType = ref.read(usernameTypeProvider);
            removeError("${usernameType.name} cannot be empty.");
            ref.read(usernameTypeProvider.notifier).update(
                  (state) =>
                      index == 0 ? UsernameType.email : UsernameType.phone,
                );
          },
        ),
      ),
    );
  }
}
