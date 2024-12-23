import 'package:flutter/material.dart';

class Themes {

  //Colors

  static const Color primaryColorDark = Color.fromARGB(255, 63, 42, 161);
  static const Color primaryColorDarkLight = Color.fromARGB(255, 201, 184, 255);
  static const Color primaryColor = Color.fromARGB(255, 211, 13, 136);
  static const Color primaryColorLight = Color.fromARGB(255, 255, 196, 233);
  static const Color secondaryColor = Color.fromARGB(255, 255, 170, 1);
  static const Color secondaryColorDark = Color.fromARGB(255, 204, 137, 0);
  static const Color secondaryColorLight = Color.fromARGB(255, 255, 203, 110);

  //Paddings

  static const EdgeInsets standardPadding = EdgeInsets.all(15);

  //Themes

  static final ThemeData mainTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    textTheme: const TextTheme(
      bodySmall: TextStyle(fontSize: 14),
      bodyMedium: TextStyle(fontSize: 16),
      bodyLarge: TextStyle(fontSize: 18),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColorDark,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )
      )
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            foregroundColor: primaryColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
        )
    ),
  );

  //Special buttons

  static ButtonStyle bottomButtonStyle = ElevatedButton.styleFrom(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
  );

  //Sizing
  static double bottomButtonHeight = 70;

  //Text
  static TextStyle instructionsTextStyle = const TextStyle(
    fontStyle: FontStyle.italic,
    color: Colors.blueGrey
  );

}