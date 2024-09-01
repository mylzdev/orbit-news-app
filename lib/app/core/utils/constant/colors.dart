import 'package:flutter/material.dart';

class TColors {
  // App theme colors
  static const Color primary = Color(0xFF6F47E4);
  static const Color secondary = Color(0xFFD9DAFD);
  static const Color accent = Color(0xFFb0c7ff);

  static const Color scaffoldColor = Color.fromARGB(255, 249, 249, 249);

  // Container colors
  static const Color containerBlue = Color(0xFFDCEDF9);
  static const Color containerPink = Color(0xFFFDD6CE);
  static const Color containerGreen = Color(0xFFE9F9DC);
  static const Color containerYellow = Color(0xFFFCEDCA);

  // Text colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C757D);
  static const Color textWhite = Colors.white;

  // Mood colors
  static const Color great = Color(0xFFA241E0);
  static const Color good = Color(0xFFB1A1F7);
  static const Color okay = primary;
  static const Color poor = Color(0xFF4A33AA);
  static const Color bad = Color(0xFF2e1aa8);

  // Background colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  // Shadow Colors
  static const Color darkShadow = darkerGrey;
  static const Color lightShadow = Color.fromARGB(255, 192, 192, 192);

  // Background Container colors
  static const Color lightContainer = Color.fromARGB(255, 238, 238, 238);
  static const Color darkContainer = Color.fromARGB(255, 65, 65, 65);
  static Color secondaryContainer =
      const Color.fromARGB(255, 52, 53, 95).withAlpha(100);

  // Button colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C757D);
  static const Color buttonDisabled = Color(0xFFC4C4C4);

  // Border colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE6E6E6);

  // Error and validation colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  // Neutral Shades
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color darkSoftGrey = Color.fromARGB(255, 218, 218, 218);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color lightGrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
}
