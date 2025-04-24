import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/features/auth/presentation/widgets/signup_form.dart';
import 'package:gcpro/features/splash/presentation/widgets/sign_up_buttons.dart';
import 'package:gcpro/gen/assets.gen.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/routes/app_route.gr.dart';

import 'package:gcpro/shared/widgets/or_splitter.dart';
import 'package:gcpro/shared/widgets/password_field.dart';
import 'package:gcpro/shared/widgets/username_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignUpScreenMobile extends StatelessWidget {
  const SignUpScreenMobile({
    required this.params,
    super.key,
  });

  final SignupParams params;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.signupTitle,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          l10n.signupDescription,
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        const Gap(24),
        UsernameTextField(
          controller: params.usernameController,
          addError: params.addError,
          removeError: params.removeError,
        ),
        CustomPasswordField(
          height: 5,
          controller: params.passwordController,
          addError: params.addError,
          removeError: params.removeError,
          lableText: l10n.password,
        ),
        const Gap(18),
        CustomPasswordField(
          height: 5,
          lableText: l10n.confirmPassword,
          controller: params.confirmPasswordController,
          addError: params.addError,
          removeError: params.removeError,
        ),
        const Gap(16),
        // Display Multiple Error Messages
        if (params.errorMessages.isNotEmpty) ...[
          ...params.errorMessages.map(
            (error) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                "• $error",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
        const Gap(32),
        BFilledButton(
          isLoading: params.state is AuthLoading,
          text: l10n.signUp,
          textColor: Theme.of(context).colorScheme.surface,
          padding: 0,
          onPressed: params.onSignup,
        ),
        const OrSplitter(vertical: 15),
        CustomOutlinedButton(
          icon: Assets.images.google.image(),
          onPressed: () {},
          text: l10n.continueWithGoogle,
        ),
        const Gap(20),
        Center(
          child: TextButton(
            onPressed: () => AutoRouter.of(context).replace(const LoginRoute()),
            child: Text.rich(
              TextSpan(
                text: l10n.alreadyHaveAccount,
                style: const TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: l10n.login,
                    style: const TextStyle(
                      color: kColorSchemeSeed,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const Gap(22),
      ],
    );
  }
}
