import 'package:blog_app_flutter/shared/colors.dart';
import 'package:flutter/material.dart';

class AuthGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const AuthGradientButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration:  BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [ColorPallet.Primary1, ColorPallet.Primary3],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight
          ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.transparent,
            fixedSize: Size(screenSize.width * 0.75, 55)),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
