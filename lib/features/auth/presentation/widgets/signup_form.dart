import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/auth/presentation/providers/auth_providers.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/features/auth/presentation/screens/orientations/signup_mobile.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:gcpro/shared/domain/providers/username_type_provider.dart';
import 'package:gcpro/shared/globals.dart';
import 'package:gcpro/shared/utils/responsive/screen_type_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignupForm extends ConsumerStatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  SignupFormState createState() => SignupFormState();
}

class SignupFormState extends ConsumerState<SignupForm> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  List<String> errorMessages = [];

  void addError(String error) {
    if (!errorMessages.contains(error)) {
      setState(() {
        errorMessages.add(error);
        // //error
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

  String? validateConfirmPassword(String? password) {
    if (password == null) {
      addError("Password must be at least 8 characters long");
      return "";
    } else {
      removeError("Password must be at least 8 characters long");
    }
    if (password.isEmpty) {
      addError("Password must be at least 8 characters long");
      return "";
    } else {
      removeError("Password must be at least 8 characters long");
    }
    if (password.length < 8) {
      addError("Password must be at least 8 characters long");
      return "";
    } else {
      removeError("Password must be at least 8 characters long");
    }

    if (password != passwordController.text) {
      addError("Passwords do not match");
      return "";
    } else {
      removeError("Passwords do not match");
    }
    return null;
  }

  void onSignup() {
    if (passwordController.text.isEmpty) {
      addError("Password must be at least 8 characters long");
    }

    if (formkey.currentState == null) return;

    if (!formkey.currentState!.validate()) return;

    if (errorMessages.isNotEmpty) return;

    ref.read(authNotifierProvider.notifier).otpSend(
          value: usernameController.text,
          otpType: OTPType.ACCOUNT_VERIFICATION,
          identifier: "phone",
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authNotifierProvider);
    final params = SignupParams(
      usernameController: usernameController,
      passwordController: passwordController,
      confirmPasswordController: confirmPasswordController,
      onSignup: onSignup,
      validatePassword: passwordValidator(addError, removeError),
      validateConfirmPassword: validateConfirmPassword,
      errorMessages: errorMessages,
      formkey: formkey,
      state: state,
      addError: addError,
      removeError: removeError,
    );

    ref.listen(
      authNotifierProvider.select((value) => value),
      (previous, next) {
        if (ModalRoute.of(context)?.isCurrent == false) return;

        final messenger = ScaffoldMessenger.of(context);
        final router = AutoRouter.of(context);

        if (next is AuthSuccess) {
          if (next.success == SuccessState.userRegistered) {}

          if (next.success == SuccessState.otpSent) {
            final username = usernameController.text;
            router
                .push(
              OTPRoute(
                username: username,
                otpType: OTPType.ACCOUNT_VERIFICATION,
                onResendOTP: () async {
                  await ref.read(authNotifierProvider.notifier).otpResend(
                        email:
                            ref.read(usernameTypeProvider) == UsernameType.email
                                ? username
                                : null,
                        phone:
                            ref.read(usernameTypeProvider) == UsernameType.phone
                                ? username
                                : null,
                        otpType: OTPType.ACCOUNT_VERIFICATION,
                      );
                },
              ),
            )
                .then((value) {
              if (value == null) {
                messenger.showSnackBar(
                  const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      "OTP verification failed",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    duration: Duration(milliseconds: SNACK_BAR_DURATION),
                  ),
                );
              }

              if (value == true) {}
            });
          }
        }
      },
    );

    return Form(
      key: formkey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ScreenTypeLayout(
          mobile: SignUpScreenMobile(params: params),
          // TODO: Implement Tablet and Desktop Layouts
          tablet: SignUpScreenMobile(params: params),
          desktop: SignUpScreenMobile(params: params),
        ),
      ),
    );
  }
}

class SignupParams {
  SignupParams({
    required this.usernameController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.errorMessages,
    required this.addError,
    required this.removeError,
    required this.formkey,
    required this.state,
    required this.onSignup,
    required this.validatePassword,
    required this.validateConfirmPassword,
  });
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final List<String> errorMessages;
  final void Function(String) addError;
  final void Function(String) removeError;
  final GlobalKey<FormState> formkey;
  final AuthState state;
  final void Function() onSignup;
  final String? Function(String?) validatePassword;
  final String? Function(String?) validateConfirmPassword;
}
