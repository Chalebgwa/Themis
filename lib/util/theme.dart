import 'package:flutter/material.dart';

final ThemeData fancyLightTheme = _buildLightTheme();
final ThemeData fancyDarkTheme = _buildDarkTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith();
}

ThemeData _buildDarkTheme() {
  const Color primaryColor = Colors.black;
  const Color secondaryColor = Colors.white;
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    background: const Color(0xFF202124),
  );
  final ThemeData base = ThemeData(
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryColorDark: const Color(0xFF0050a0),
    primaryColorLight: secondaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: const Color(0xFF6997DF),
    canvasColor: const Color(0xFF202124),
    scaffoldBackgroundColor: const Color(0xFF202124),
    errorColor: const Color(0xFFB00020),
    colorScheme: colorScheme,
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}

ThemeData _buildLightTheme() {
  Color primaryColor = Colors.white;
  Color secondaryColor = Color.fromRGBO(229, 187, 77, 1);

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
    background: Colors.white,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: secondaryColor,
    splashColor: Colors.white24,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
  );
}
