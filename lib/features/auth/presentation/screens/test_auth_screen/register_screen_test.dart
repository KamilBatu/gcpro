import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gcpro/features/auth/presentation/providers/auth.dart';
import 'package:gcpro/features/auth/presentation/screens/test_auth_screen/login_screen_test.dart';
import 'package:gcpro/features/marketplace/presentation/widgets/reusable_widgets/custom_button.dart';
import 'package:gcpro/shared/widgets/text_field.dart';
import 'package:gcpro_design_system/tokens/tokens.dart';

class SignupScreenTest extends ConsumerStatefulWidget {
  const SignupScreenTest({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreenTest> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    try {
      setState(() {
        _errorMessage = '';
      });
      await ref.read(authProvider.notifier).register(
            // Changed login to signup
            _emailController.text.trim(),
            _passwordController.text.trim(),
          );
    } catch (error) {
      if (mounted) {
        setState(() {
          _errorMessage = error.toString().replaceFirst('Exception: ', '');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Signup'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                    hintText: 'enter username',
                    lableText: 'userName',
                    controller: _emailController,
                    height: 10,
                    suffixIcon: Icon(Icons.supervised_user_circle),
                    obscureText: true),
                const SizedBox(height: 16),
                CustomTextField(
                    hintText: 'enter email',
                    lableText: 'Email',
                    controller: _emailController,
                    height: 10,
                    suffixIcon: Icon(Icons.email),
                    obscureText: true),
                const SizedBox(height: 25),
                CustomTextField(
                    hintText: 'enter password',
                    lableText: 'password',
                    controller: _passwordController,
                    height: 10,
                    suffixIcon: Icon(Icons.password),
                    obscureText: true),
                const SizedBox(height: 15),
                CustomTextField(
                    hintText: 'confirm password',
                    lableText: 'confirm password',
                    controller: _passwordController,
                    suffixIcon: Icon(Icons.password),
                    height: 10,
                    obscureText: true),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  onPressed: () {
                    _handleRegister();
                  },
                  cornerRadius: 10,
                  label: 'Register',
                  minimumSize: Size(MediaQuery.sizeOf(context).width * 0.9, 50),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreenTest())),
                  child: Text(
                    'already have an account',
                    style: TextStyle(color: kColorSchemeSeed),
                  ),
                ),
                if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
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
