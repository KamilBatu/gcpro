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
      if (value == null || value.isEmpty) {
        addError("${usernameType.name} cannot be empty.");
        return "";
      } else {
        removeError("${usernameType.name} cannot be empty.");
      }

      if (usernameType == UsernameType.email) {
        final emailRegex =
            RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
        if (!emailRegex.hasMatch(value)) {
          addError("Invalid email address.");
          return "";
        } else {
          removeError("Invalid email address.");
        }
      } else if (usernameType == UsernameType.phone) {
        final phoneRegex =
            RegExp(r"^[79]\d{8}$"); // 9 or 7 followed by 8 digits
        if (!phoneRegex.hasMatch(value)) {
          removeError("Invalid email address.");
          addError(
            "Invalid phone number. Must start with 9 or 7 and have 9 digits.",
          );
          return "";
        } else {
          removeError(
            "Invalid phone number. Must start with 9 or 7 and have 9 digits.",
          );
        }
      }

      if (value.length < 3) {
        addError("Username must be at least 3 characters long.");
        return "";
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
                : AppLocalizations.of(context)!.enterYourPhoneNumber,
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
                  )
                : null,
            suffixIcon: Icon(
              usernameType == UsernameType.email ? Icons.email : Icons.phone,
              size: 15,
            ),
            validator: validateUsername,
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
