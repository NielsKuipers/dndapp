import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          background: const Color(0xff1d242b),
          primary: const Color(0xff33404d),
          secondary: const Color(0xff2B82D9),
          seedColor: Colors.purple,
          brightness: Brightness.dark),
      dividerColor: const Color(0xff33404d),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
        fontSize: 15,
      )));
}
