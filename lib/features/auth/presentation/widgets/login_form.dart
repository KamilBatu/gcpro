import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/auth/presentation/providers/auth_providers.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/features/auth/presentation/screens/orientations/login_mobile.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:gcpro/shared/domain/providers/global_error_provider.dart';
import 'package:gcpro/shared/domain/providers/username_type_provider.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:gcpro/shared/utils/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => LoginFormState();
}

class LoginFormState extends ConsumerState<LoginForm> {
  List<String> errorMessages = [];
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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

  void onLogin() {
    if (usernameController.text.isEmpty) {
      addError(
        AppLocalizations.of(context)
            .password_must_be_at_least_8_characters_long,
      );
    } else {
      removeError(
        AppLocalizations.of(context)
            .password_must_be_at_least_8_characters_long,
      );
    }

    if (passwordController.text.isEmpty) {
      addError(
        AppLocalizations.of(context)
            .password_must_be_at_least_8_characters_long,
      );
    } else {
      removeError(
        AppLocalizations.of(context)
            .password_must_be_at_least_8_characters_long,
      );
    }

    if (formkey.currentState == null) return;

    if (!formkey.currentState!.validate()) return;

    if (errorMessages.isNotEmpty) return;

    ref.read(authNotifierProvider.notifier).loginUser(usernameController.text,
        passwordController.text, ref.read(usernameTypeProvider));
    // otpSend(
    //       value: usernameController.text,
    //       identifier: AppLocalizations.of(context).email,
    //       otpType: OTPType.TWO_FACTOR_AUTHENTICATION,
    //     );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);

    ref.listen(
      authNotifierProvider.select((value) => value),
      (previous, next) {
        if (ModalRoute.of(context)?.isCurrent == false) return;
        if (next is AuthSuccess) {
          if (next.success == SuccessState.userLoggedIn) {
            // Save username to shared pref
            // ref.read(sharedPrefstorageServiceProvider).set(
            //       'username',
            //       usernameController.text,
            //     );

            AutoRouter.of(context).pushAndPopUntil(
              const DashboardRoute(),
              predicate: (_) => false,
            );
            return;
          }
          if (next.success == SuccessState.otpSent) {
            AutoRouter.of(context)
                .push(
              OTPRoute(
                username: usernameController.text,
                otpType: OTPType.TWO_FACTOR_AUTHENTICATION,
                onResendOTP: () async {
                  await ref.read(authNotifierProvider.notifier).otpResend(
                        email: usernameController.text,
                        phone: usernameController.text,
                      );
                },
              ),
            )
                .then((value) {
              if (value == true) {
                ref.read(authNotifierProvider.notifier).loginUser(
                      usernameController.text,
                      passwordController.text,
                      ref.read(usernameTypeProvider),
                    );
              } else {
                ref
                    .read(globalErrorNotifierProvider.notifier)
                    .setError('OTP verification failed');
              }
            });
          }
        }
        if (next is AuthFailure) {
          if (next.exception.statusCode == 404) return;
          if (next.exception.statusCode == 400) return;

          ref.read(authNotifierProvider.notifier).otpSend(
                value: usernameController.text,
                identifier: AppLocalizations.of(context).email,
                otpType: OTPType.TWO_FACTOR_AUTHENTICATION,
              );
        }
      },
    );

    final loginParams = LoginScreenParams(
      usernameController: usernameController,
      passwordController: passwordController,
      errorMessages: errorMessages,
      removeError: removeError,
      onLogin: onLogin,
      addError: addError,
      formkey: formkey,
      state: state,
    );

    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ScreenTypeLayout(
          mobile: LoginMobileLayout(params: loginParams),
          // TODO: Implement Tablet and Desktop Layouts
          tablet: LoginMobileLayout(params: loginParams),
          desktop: LoginMobileLayout(params: loginParams),
        ),
      ),
    );
  }
}

class LoginScreenParams {
  LoginScreenParams({
    required this.usernameController,
    required this.passwordController,
    required this.formkey,
    required this.errorMessages,
    required this.addError,
    required this.removeError,
    required this.state,
    required this.onLogin,
  });
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formkey;
  final List<String> errorMessages;
  final void Function(String) addError;
  final void Function(String) removeError;
  final AuthState state;
  final void Function() onLogin;
}
