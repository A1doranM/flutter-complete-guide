import 'package:expense_tracker_app/expenses.dart';
import 'package:flutter/material.dart';

ColorScheme mainColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

ColorScheme darkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      colorScheme: darkScheme,
      cardTheme: const CardTheme().copyWith(
        color: darkScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkScheme.primaryContainer,
          foregroundColor: darkScheme.onPrimaryContainer,
        ),
      ),
    ),
    theme: ThemeData().copyWith(
      colorScheme: mainColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: mainColorScheme.onPrimaryContainer,
          foregroundColor: mainColorScheme.primaryContainer),
      cardTheme: const CardTheme().copyWith(
        color: mainColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: mainColorScheme.primaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: mainColorScheme.onSecondaryContainer,
              fontSize: 16,
            ),
          ),
    ),
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
