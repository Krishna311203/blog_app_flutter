import 'package:blog_app_flutter/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:blog_app_flutter/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blog_app_flutter/shared/colors.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up.',
              style: TextStyle(
                fontSize: 50,
                color: ColorPallet.Primary3,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 90),
             const AuthFormField(hintText: "name"),
            const SizedBox(height: 20),
            const AuthFormField(hintText: "Email"),
            const SizedBox(height: 20),
            const AuthFormField(hintText: "Password"),
            const SizedBox(height: 30),
            const AuthGradientButton(text: 'Sign Up.'),
            const SizedBox(height: 30),
            RichText(text: const TextSpan(text: "Don't have an account ?"))
          ],
        ),
      ),
    );
  }
}
