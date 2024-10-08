import 'package:blog_app_flutter/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app_flutter/features/auth/presentation/pages/sign_in_Page.dart';
import 'package:blog_app_flutter/features/auth/presentation/widgets/auth_gradient_button.dart';
import 'package:blog_app_flutter/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blog_app_flutter/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignUpPage());
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                const SizedBox(height: 50),
                AuthFormField(hintText: "name", controller: nameController),
                const SizedBox(height: 20),
                AuthFormField(hintText: "Email", controller: emailController),
                const SizedBox(height: 20),
                AuthFormField(
                    hintText: "Password",
                    controller: passwordController,
                    isObscureText: true),
                const SizedBox(height: 30),
                AuthGradientButton(
                  text: 'Sign Up.',
                  onPressed: () {
                      print("pressed");
                    if (formKey.currentState?.validate() ?? false) {
                      context.read<AuthBloc>().add(AuthSignUp(
                            name: nameController.text.trim(),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          ));
                    }
                  },
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, SignInPage.route());
                  },
                  child: RichText(
                      text: TextSpan(
                          text: "Already have an account ? ",
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                        TextSpan(
                            text: 'Sign In.',
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
      ),
    );
  }
}
