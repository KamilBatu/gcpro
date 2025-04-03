import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/features/auth/presentation/widgets/login_form.dart';
import 'package:gcpro/features/splash/presentation/widgets/sign_up_buttons.dart';
import 'package:gcpro/gen/assets.gen.dart';
import 'package:gcpro/l10n/app_localizations.dart';
import 'package:gcpro/routes/app_route.gr.dart';

import 'package:gcpro/shared/widgets/or_splitter.dart';
import 'package:gcpro/shared/widgets/password_field.dart';
import 'package:gcpro/shared/widgets/username_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginMobileLayout extends StatelessWidget {
  const LoginMobileLayout({
    required this.params,
    super.key,
  });

  final LoginScreenParams params;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n!.welcomeMessage,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        Text(
          l10n.pleaseEnterYourCredentials,
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
        const Gap(16),
        CustomPasswordField(
          height: 5,
          controller: params.passwordController,
          addError: params.addError,
          removeError: params.removeError,
          onSaved: params.onLogin,
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
          text: l10n.login,
          textColor: Theme.of(context).colorScheme.surface,
          padding: 0,
          onPressed: params.onLogin,
        ),
        const OrSplitter(vertical: 18),
        CustomOutlinedButton(
          icon: Assets.images.google.image(),
          onPressed: () {},
          text: l10n.continueWithGoogle,
        ),
        const Gap(20),
        Center(
          child: TextButton(
            onPressed: () =>
                AutoRouter.of(context).replace(const SignupRoute()),
            child: Text.rich(
              TextSpan(
                text: "${l10n.dontHaveAnAccount} ",
                style: const TextStyle(
                  color: Color(0xFF858585),
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: l10n.signUp,
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
