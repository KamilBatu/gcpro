import 'package:auto_route/auto_route.dart';
import 'package:gcpro/features/auth/presentation/widgets/login_form.dart';
import 'package:gcpro/shared/widgets/localization_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});
  static const routeName = '/loginScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.surface,
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
            children: [LoginForm()],
          ),
        ),
      ),
    );
  }
}
