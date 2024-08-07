import 'package:flutter/material.dart';

class AuthFormField extends StatelessWidget {
  final String hintText;
  const AuthFormField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}