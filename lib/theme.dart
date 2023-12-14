import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    useMaterial3: true,

    // dialog theme
    dialogTheme: const DialogTheme(backgroundColor: Color(0xff1C222B)),

    // input themes
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFFDFDFDF),
        ),
      ),
      floatingLabelStyle: TextStyle(color: Color(0xFFDFDFDF)),
      labelStyle: TextStyle(color: Color(0xFFDFDFDF)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF6C8096),
        ),
      ),
    ),

    // checkbox theme
    checkboxTheme: CheckboxThemeData(
      checkColor: const MaterialStatePropertyAll(Color(0xFFDFDFDF)),
      fillColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const Color(0xff5659F0);
          }
          return null;
        },
      ),
    ),

    // base colorscheme
    colorScheme: ColorScheme.fromSeed(
        background: const Color(0xff1d242b),
        primary: const Color(0xff33404d),
        secondary: const Color(0xff5659F0),
        seedColor: const Color(0xff33404d),
        brightness: Brightness.dark),
    dividerColor: const Color(0xff33404d),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: Color(0xFFDFDFDF),
        fontSize: 15,
      ),
    ),

    //Button themes
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xff5659F0),
        foregroundColor: const Color(0xFFFFFFFF),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xff5659F0),
        foregroundColor: const Color(0xFFFFFFFF),
      ),
    ),
  );
}
