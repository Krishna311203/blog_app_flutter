import 'package:blog_app_flutter/features/auth/presentation/pages/signUp_page.dart';
import 'package:flutter/material.dart';

import '../../../../shared/colors.dart';
import '../widgets/auth_gradient_button.dart';
import '../widgets/auth_text_field.dart';

class SignInPage extends StatefulWidget {
  static route() => MaterialPageRoute(
                          builder: (context) => const SignInPage());
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sign In.',
                style: TextStyle(
                  fontSize: 50,
                  color: ColorPallet.Primary3,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              AuthFormField(hintText: "Email", controller: emailController),
              const SizedBox(height: 20),
              AuthFormField(
                  hintText: "Password",
                  controller: passwordController,
                  isObscureText: true),
              const SizedBox(height: 30),
              const AuthGradientButton(text: 'Sign In.'),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, SignUpPage.route());
                },
                child: RichText(
                    text: TextSpan(
                        text: "Don't have an account ? ",
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                          text: 'Sign Up.',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color: ColorPallet.Primary1,
                                  fontWeight: FontWeight.bold))
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
