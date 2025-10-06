import 'package:flutter/material.dart';

// Text styles following design system
class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color(0xFF0077B6),
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey,
  );

  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}

// Spacing constants
class AppSpacing {
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;
}
