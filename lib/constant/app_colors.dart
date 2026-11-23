import 'package:flutter/material.dart';

class AppColors {
  static const primaryTxt = Color(0xFFFFFFFF);
  static const secTxt = Color(0xFF94A3B8);
  static const secBtn = Color(0xFF19203A);

  // Brand & Accent Colors
  static const Color primary = Color(0xFF4F8BFF);
  static const Color primaryDark = Color(0xFF2563EB);
  static const Color accentCyan = Color(0xFF38BDF8);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF5B8DEF), Color(0xFF38BDF8)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dark Theme Palette
  static const Color darkBg = Color(0xFF0B1120);
  static const Color darkSurface = Color(0xFF131C31);
  static const Color darkSurfaceElevated = Color(0xFF1A2540);
  static const Color darkBorder = Color(0xFF24324D);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);

  // Light Theme Palette
  static const Color lightBg = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceElevated = Color(0xFFF1F5F9);
  static const Color lightBorder = Color(0xFFE2E8F0);
  static const Color lightTextPrimary = Color(0xFF0F172A);
  static const Color lightTextSecondary = Color(0xFF64748B);

  // Semantic / Status Colors (Verified, Paid, Pending, Due, Late, Rejected)
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

}