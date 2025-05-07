import 'package:flutter/material.dart';

import '../core/colors.dart';

import '../extensions/int.dart';

ThemeData getTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    dividerTheme: const DividerThemeData(thickness: 1, space: 1),
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0.0,
      backgroundColor: AppColors.primary,
      centerTitle: true,
      actionsIconTheme: IconThemeData(size: 24, color: Colors.white),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 32),
      headlineMedium: TextStyle(fontSize: 28),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 22),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 14),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        elevation: const WidgetStatePropertyAll(0),
        minimumSize: const WidgetStatePropertyAll(Size.zero),
        backgroundColor: WidgetStateProperty.resolveWith((final states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey.withValues(alpha: 0.5);
          }
          if (states.contains(WidgetState.hovered)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        foregroundColor: WidgetStateProperty.resolveWith((final states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.grey;
          }
          if (states.contains(WidgetState.hovered)) {
            return Colors.white;
          }
          return Colors.white;
        }),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 16.toBaseSize(),
            horizontal: 12.toBaseSize(),
          ),
        ),
        textStyle: const WidgetStatePropertyAll(
          TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.toBaseSize()),
          ),
        ),
      ),
    ),
  );
}
