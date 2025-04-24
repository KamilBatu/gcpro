import 'package:auto_route/auto_route.dart';
import 'package:gcpro_design_system/gcpro_design_system.dart';
import 'package:gcpro/features/auth/presentation/providers/auth_providers.dart';
import 'package:gcpro/features/auth/presentation/providers/state/auth_state.dart';
import 'package:gcpro/gen/assets.gen.dart';
import 'package:gcpro/gen/l10n.dart';
import 'package:gcpro/shared/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ResetPasswordScreen extends ConsumerWidget {
  const ResetPasswordScreen({super.key});
  static const routeName = '/resetPasswordScreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final state = ref.watch(authNotifierProvider);
    ref.listen(
      authNotifierProvider.select((value) => value),
      (previous, next) {
        if (ModalRoute.of(context)?.isCurrent == false) return;
      },
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          AppLocalizations.of(context).reset_password,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          onPressed: () => AutoRouter.of(context).maybePopTop(),
        ),
      ),
      body: const Padding(
        padding: kP20,
        // false ? ResetForm(state: state) :
        child: SuccessScreen(),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(16),
        Assets.images.illustration1.image(height: 200),
        const Gap(16),
        Text(
          AppLocalizations.of(context).password_has_been_reset_successfully,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Gap(16),
        Text(
          AppLocalizations.of(context)
              .please_use_the_new_password_when_logging_in,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const Gap(48),
        BFilledButton(
          isLoading: false,
          text: AppLocalizations.of(context).ok,
          onPressed: () => AutoRouter.of(context).maybePop(),
        ),
      ],
    );
  }
}

class ResetForm extends StatefulWidget {
  const ResetForm({
    required this.state,
    super.key,
  });

  final AuthState state;

  @override
  State<ResetForm> createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
  final passwordController = TextEditingController();

  List<String> errorMessages = [];

  final formKey = GlobalKey<FormState>();

  final affirmPasswordController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUnfocus,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          CustomPasswordField(
            height: 5,
            controller: passwordController,
            addError: addError,
            removeError: removeError,
          ),
          const Gap(16),
          CustomPasswordField(
            height: 5,
            controller: affirmPasswordController,
            hintText: AppLocalizations.of(context).confirm_password,
            addError: addError,
            removeError: removeError,
          ),
          const Gap(48),
          BFilledButton(
            isLoading: widget.state is AuthLoading,
            text: AppLocalizations.of(context).change_password,
            padding: 0,
            onPressed: () {
              if (!formKey.currentState!.validate()) return;
              // context.read(authNotifierProvider.notifier).resetPassword(
            },
          ),
        ],
      ),
    );
  }
}
