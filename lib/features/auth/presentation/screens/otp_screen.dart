import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
import 'package:gcpro/features/auth/presentation/providers/auth_providers.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/shared/globals.dart';

import 'package:gcpro/shared/widgets/localization_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

@RoutePage()
class OTPScreen extends ConsumerWidget {
  const OTPScreen({
    required this.username,
    required this.otpType,
    required this.onResendOTP,
    super.key,
  });
  static const routeName = '/otpScreen';

  final String username;
  final OTPType otpType;
  final Future<void> Function() onResendOTP;

  bool get email => username.contains('@');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      authNotifierProvider.select((value) => value),
      (previous, next) {
        if (ModalRoute.of(context)?.isCurrent == false) return;

        final router = AutoRouter.of(context);

        if (next is AuthSuccess && next.success == SuccessState.otpVerified) {
          ScaffoldMessenger.of(context)
              .showSnackBar(
                SnackBar(
                  content: const Text('OTP verified successfully'),
                  backgroundColor: kColorStatusCode200,
                  duration: const Duration(milliseconds: SNACK_BAR_DURATION),
                ),
              )
              .closed
              .then((_) {
            router.maybePopTop(true);
          });
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        leadingWidth: 48,
        actions: const [
          ChooseLocalization(),
          Gap(12),
        ],
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(16),
                Text(
                  "Verification",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Gap(16),
                Text(
                  "we've send you the verification code on  ${email ? "email" : "phone"}",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                ),
                const Gap(24),
                Expanded(
                  child: OTPForm(
                    otpType: otpType,
                    onResendOTP: onResendOTP,
                    username: username,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTPForm extends ConsumerStatefulWidget {
  const OTPForm({
    required this.otpType,
    required this.onResendOTP,
    required this.username,
    super.key,
  });

  final OTPType otpType;
  final String username;
  final Function onResendOTP;

  @override
  OTPFormState createState() => OTPFormState();
}

class OTPFormState extends ConsumerState<OTPForm> {
  final TextEditingController textEditingController = TextEditingController();
  bool isButtonDisabled = true;
  int secondsRemaining = 60;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          isButtonDisabled = false;
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: PinCodeTextField(
              length: 4,
              useHapticFeedback: true,
              autoFocus: true,
              animationType: AnimationType.fade,
              // enabled: ref.watch(authStateNotifierProvider
              //     .select((value) => value is! Loading)),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(12),
                fieldHeight: 55,
                fieldWidth: 55,
                activeFillColor: Colors.white,
                selectedColor: kColorSchemeSeed,
                inactiveColor: const Color.fromARGB(255, 197, 197, 197),
                activeColor: kColorSchemeSeed,
              ),
              animationDuration: const Duration(milliseconds: 300),
              keyboardType: TextInputType.number,
              errorTextSpace: 32,
              validator: (value) {
                if (int.tryParse(value ?? "") == null) {
                  return 'Enter a valid code';
                }

                if (value!.length < 6) {
                  return 'Enter the 6 digit code';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.disabled,
              textStyle: Theme.of(context).textTheme.bodyMedium,
              dialogConfig: DialogConfig(
                dialogTitle: 'Paste the code',
                dialogContent: 'Do you want to paste the code?',
              ),
              controller: textEditingController,
              onCompleted: (otp) {
                if (int.tryParse(otp) == null) return;

                ref.read(authNotifierProvider.notifier).otpVerify(
                      value: otp,
                      username: widget.username,
                      otpType: widget.otpType,
                    );
              },
              beforeTextPaste: (text) {
                if ((text?.length ?? 0) > 6) return false;
                if (int.tryParse(text ?? '') == null) return false;
                return true;
              },
              showCursor: false,
              appContext: context,
            ),
          ),
          const Gap(16),
          BFilledButton(
            onPressed: () {
              ref.read(authNotifierProvider.notifier).otpVerify(
                    value: textEditingController.text,
                    username: widget.username,
                    otpType: widget.otpType,
                  );
            },
            text: 'Continue',
            padding: 0,
            isLoading: ref.watch(authNotifierProvider) is AuthLoading,
          ),
          const Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (secondsRemaining > 0)
                Text(
                  "Re-send Code in ",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                ),
              TextButton(
                onPressed: isButtonDisabled
                    ? null
                    : () async {
                        await widget.onResendOTP();
                        setState(() {
                          isButtonDisabled = true;
                          secondsRemaining = 60;
                          startTimer();
                        });
                      },
                child: Text(
                  isButtonDisabled ? '0:$secondsRemaining s' : 'Resend Code',
                  style: Theme.of(context).primaryTextTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
