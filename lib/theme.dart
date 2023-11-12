import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          background: const Color(0xff1d242b),
          primary: const Color(0xff33404d),
          seedColor: Colors.purple,
          brightness: Brightness.dark),
      dividerColor: const Color(0xff33404d),
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
        fontSize: 15,
      )));
}
