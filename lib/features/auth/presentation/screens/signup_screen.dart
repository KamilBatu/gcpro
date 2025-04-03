import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/auth/presentation/widgets/signup_form.dart';
import 'package:gcpro/shared/widgets/localization_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class SignupScreen extends ConsumerWidget {
  const SignupScreen({super.key});
  static const routeName = '/signupScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        toolbarHeight: 50,
        actions: const [
          ChooseLocalization(),
          Gap(12),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SignupForm()],
          ),
        ),
      ),
    );
  }
}
