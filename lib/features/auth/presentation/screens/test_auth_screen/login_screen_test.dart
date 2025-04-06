import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro/features/auth/presentation/providers/auth.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/custom_button.dart';
import 'package:gcpro/routes/app_route.gr.dart';
import 'package:gcpro/shared/widgets/text_field.dart';
import 'package:gcpro_design_system/gcpro_design_sysytem.dart';
import 'register_screen_test.dart';

class LoginScreenTest extends ConsumerStatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreenTest> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    try {
      await ref
          .read(authProvider.notifier)
          .login(_emailController.text.trim(), _passwordController.text.trim());
      if (mounted) {
        context.router.push(DashboardRoute());
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          String errorMsg = error.toString().replaceFirst('Exception: ', '');
          if (errorMsg.contains('email') || errorMsg.contains('user')) {
            _emailError = errorMsg;
          } else if (errorMsg.contains('password')) {
            _passwordError = errorMsg;
          } else {
            _emailError = 'Login, failed. Please check your credentials.';
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(child: Text('Login')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  hintText: 'Enter email',
                  lableText: 'Email',
                  controller: _emailController,
                  height: 10,
                  suffixIcon: const Icon(Icons.email),
                  obscureText: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                CustomTextField(
                  hintText: 'Enter password',
                  lableText: 'Password',
                  controller: _passwordController,
                  height: 10,
                  suffixIcon: const Icon(Icons.password),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _handleLogin();
                    }
                  },
                  cornerRadius: 10,
                  label: 'Login',
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.9, 50),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignupScreenTest()),
                    );
                  },
                  label: 'Sign Up',
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.9, 50),
                  backgroundColor: Colors.white54,
                  labelColor: kColorSchemeSeed,
                  cornerRadius: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
