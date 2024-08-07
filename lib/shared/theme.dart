import 'package:blog_app_flutter/shared/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static border(Color color) => OutlineInputBorder(
        borderSide: BorderSide(width: 3, color: color),
        borderRadius: BorderRadius.circular(10),
      );

  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: ColorPallet.Background,
    inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(27),
        enabledBorder: border(Color.fromRGBO(78, 77, 79, 1)),
        focusedBorder: border(ColorPallet.Primary2)),
  );
}
