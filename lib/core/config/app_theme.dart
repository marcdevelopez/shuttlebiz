import 'package:flutter/material.dart';

// App theme configuration based on SPECIFICATIONS.md
class AppTheme {
  // Colors from specifications
  static const Color primaryBlue = Color(0xFF0077B6); // Azul intenso
  static const Color coralRed = Color(0xFFFF6B6B); // Rojo coral

  // Status colors
  static const Color availableGreen = Color(0xFF4CAF50);
  static const Color unavailableRed = Color(0xFFF44336);
  static const Color inactiveGray = Color(0xFF9E9E9E);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
      ),
    );
  }
}
