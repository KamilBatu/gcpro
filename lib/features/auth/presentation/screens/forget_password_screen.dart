import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/widgets/button_filled.dart';
import 'package:gcpro/features/auth/presentation/providers/auth_providers.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/l10n/string_hardcoded.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:gcpro/shared/widgets/username_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ForgetPasswordScreen extends ConsumerStatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const routeName = '/forgetpasswordScreen';

  @override
  ConsumerState<ForgetPasswordScreen> createState() =>
      ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usenameController = TextEditingController();
  List<String> errorMessages = [];

  @override
  Widget build(BuildContext context) {
    void addError(String error) {
      if (!errorMessages.contains(error)) {
        setState(() {
          errorMessages.add(error);
        });
      }
    }

    void removeError(String error) {
      if (errorMessages.contains(error)) {
        setState(() {
          errorMessages.remove(error);
        });
      }
    }

    final state = ref.watch(authNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        centerTitle: false,
        title: Text(
          AppLocalizations.of(context).forget_password,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        leadingWidth: 48,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 16,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UsernameTextField(
                    controller: _usenameController,
                    addError: addError,
                    removeError: removeError,
                  ),
                  const Gap(16),
                  Text(
                    "Please enter your username to reset your password"
                        .hardcoded,
                    // AppLocalizations.of(context).please_enter_your_username_to_reset_your_password,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                  const Gap(32),
                  BFilledButton(
                    text: AppLocalizations.of(context).send,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ref.read(authNotifierProvider.notifier).otpSend(
                              value: _usenameController.text,
                              identifier: AppLocalizations.of(context).email,
                              otpType: OTPType.TWO_FACTOR_AUTHENTICATION,
                            );
                      }
                    },
                    isLoading: state is AuthLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
