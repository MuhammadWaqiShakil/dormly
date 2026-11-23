import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // =========================================================================
  // BRAND COLORS (Used across the app & in custom gradients)
  // =========================================================================
  static const Color primaryBlue = Color(0xFF5695FE);
  static const Color primaryCyan = Color(0xFF2BC8F1);
  static const Color deepNavy    = Color(0xFF0C1327); // Used in dark icon & light primary text

  // Primary Button & Logo Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, primaryCyan],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Background Gradient (Dark Mode)
  static const LinearGradient darkBgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF151C36), // Deep navy top
      Color(0xFF0E162B), // Ambient blue middle
      Color(0xFF080D1A), // Dark base
    ],
  );

  // Background Gradient (Light Mode)
  static const LinearGradient lightBgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFEFF6FF), // Soft sky-blue tint at top
      Color(0xFFF8FAFC), // Clean off-white
      Color(0xFFFFFFFF), // Pure white at bottom
    ],
  );

  // =========================================================================
  // LIGHT THEME
  // =========================================================================
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC), // Soft clean background
      primaryColor: primaryBlue,

      // Color scheme for widgets
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        secondary: primaryCyan,
        surface: Colors.white,
        onSurface: Color(0xFF0C1327), // Dark text on light background
      ),

      // Fonts (Sora for headings, DM Sans for body)
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.sora(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF0C1327),
        ),
        bodyLarge: GoogleFonts.dmSans(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF64748B), // Slate grey
        ),
        bodyMedium: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF64748B),
        ),
        labelLarge: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF64748B),
        ),
      ),

      // Text Fields (Inputs) in Light Mode
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF1F5F9), // Light grey input fill
        hintStyle: GoogleFonts.dmSans(
          fontSize: 15,
          color: const Color(0xFF94A3B8),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryBlue, width: 1.5),
        ),
      ),

      // Elevated Buttons in Light Mode
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // =========================================================================
  // DARK THEME (Matching your provided UI pictures)
  // =========================================================================
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF080D1A), // Dark navy base
      primaryColor: primaryCyan,

      // Color scheme for widgets
      colorScheme: const ColorScheme.dark(
        primary: primaryCyan,
        secondary: primaryBlue,
        surface: Color(0xFF12192B), // Dark field & card surface
        onSurface: Colors.white,
      ),

      // Fonts (Sora for headings, DM Sans for body)
      textTheme: TextTheme(
        headlineLarge: GoogleFonts.sora(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.dmSans(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF94A3B8), // Soft slate
        ),
        bodyMedium: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF94A3B8),
        ),
        labelLarge: GoogleFonts.dmSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF94A3B8),
        ),
      ),

      // Text Fields (Inputs) in Dark Mode
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF12192B), // Dark field fill from screenshot
        hintStyle: GoogleFonts.dmSans(
          fontSize: 15,
          color: const Color(0xFF64748B),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF1E283F)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF1E283F)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: primaryCyan, width: 1.5),
        ),
      ),

      // Elevated Buttons in Dark Mode
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}