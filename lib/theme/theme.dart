import 'package:flutter/material.dart';

class FlutterTodosTheme {
  static ThemeData get light => ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color(0xFF13B9FF),
    ),
    colorScheme: ColorScheme.fromSwatch(
      accentColor: const Color(0xFF13B9FF),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
  );

  static ThemeData get dark => ThemeData(
    appBarTheme: const AppBarTheme(
      color: Color(0xFF13B9FF),
    ),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      accentColor: const Color(0xFF13B9FF),
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
    ),
  );
}