import 'package:flutter/material.dart';

// https://www.color-hex.com/color-palette/22229
const _primaryColor = Color(0xFF50B8E7);

final darkTheme = ThemeData(
  useMaterial3: true,
  primaryColor: _primaryColor,
  textTheme: _textTheme,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _primaryColor,
    brightness: Brightness.dark,
  ),
);

final lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: _primaryColor,
  textTheme: _textTheme,
  scaffoldBackgroundColor: const Color(0xFFEDF7FC),
  dividerTheme: const DividerThemeData(
    color: Color(0xFFEDF7FC),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: _primaryColor,
    brightness: Brightness.light,
  ),
);

const _textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  ),
);
