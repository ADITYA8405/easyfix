import 'package:flutter/material.dart';

/// EasyFix Brand Color System
abstract class AppColors {
  // Brand
  static const Color primary = Color(0xFF7B2FF7);
  static const Color secondary = Color(0xFFF107A3);
  static const Color primaryLight = Color(0xFFEDE0FF);

  // Background
  static const Color background = Color(0xFFF9F9FB);
  static const Color card = Colors.white;
  static const Color surface = Color(0xFFF2F2F7);

  // Text
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B6B6B);
  static const Color textHint = Color(0xFFAAAAAA);

  // Semantic
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color star = Color(0xFFFBBF24);
  static const Color divider = Color(0xFFEEEEEE);

  // Gradient
  static const LinearGradient brandGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFFEDE0FF), Color(0xFFFCE4F5)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
