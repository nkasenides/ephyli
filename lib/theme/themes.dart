import 'package:flutter/material.dart';

class Themes {

  static final Color primaryColorDark = Color.fromARGB(255, 63, 42, 161);
  static final Color primaryColor = Color.fromARGB(255, 211, 13, 136);
  static final Color secondaryColor = Color.fromARGB(255, 255, 170, 1);

  static const EdgeInsets standardPadding = EdgeInsets.all(15);

  static final ThemeData mainTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColorDark,
        foregroundColor: Colors.white,
        elevation: 3,
        textStyle: const TextStyle(fontSize: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            foregroundColor: primaryColorDark,
            textStyle: const TextStyle(fontSize: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
        )
    ),
  );

}