import 'package:flutter/material.dart';

class AppColors {
  // Modern Primary Colors - Updated to trending teal/mint theme
  static const Color primary = Color(0xFF10B981); // Emerald green
  static const Color primaryLight = Color(0xFF34D399);
  static const Color primaryDark = Color(0xFF059669);

  // Secondary colors
  static const Color secondary = Color(0xFF3B82F6); // Blue
  static const Color accent = Color(0xFFF59E0B); // Amber for highlights

  // Modern Background colors
  static const Color background = Color(0xFFF8FAFC); // Softer background
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);

  // Text colors with better contrast
  static const Color textPrimary =
      Color(0xFF0F172A); // Darker for better readability
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);

  // Status colors - Modern palette
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Modern gradient colors
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF10B981), Color(0xFF059669)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF8FAFC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Category colors for budget visualization - More vibrant
  static const List<Color> categoryColors = [
    Color(0xFF10B981), // Savings - Emerald
    Color(0xFF3B82F6), // Bills - Blue
    Color(0xFFF59E0B), // Emergency - Amber
    Color(0xFF8B5CF6), // Spending - Purple
    Color(0xFFEF4444), // Food - Red
    Color(0xFF06B6D4), // Transport - Cyan
    Color(0xFF84CC16), // Other - Lime
  ];

  // Shadows
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x0A000000),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x0D000000),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> softShadow = [
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ];
}
