import 'package:flutter/material.dart';

class AppColors {
  // PayDay Brand Colors
  static const Color primary = Color(0xFF009362); // PayDay Green
  static const Color secondary = Color(0xFFFECB47); // PayDay Amber
  
  // Primary color variations
  static const Color primaryLight = Color(0xFF00B678);
  static const Color primaryDark = Color(0xFF006B45);
  
  // Secondary color variations  
  static const Color secondaryLight = Color(0xFFFFD666);
  static const Color secondaryDark = Color(0xFFE6B029);

  // Background colors
  static const Color background = Color(0xFFF8FAFC);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color textTertiary = Color(0xFF94A3B8);

  // Status colors
  static const Color success = Color(0xFF009362); // Same as primary
  static const Color warning = Color(0xFFFECB47); // Same as secondary
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // PayDay brand gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF009362), Color(0xFF00B678)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    colors: [Color(0xFFFECB47), Color(0xFFFFD666)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFF009362), Color(0xFFFECB47)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Allocation category colors for different savings goals
  static const List<Color> allocationColors = [
    Color(0xFF009362), // Emergency Fund - Primary Green
    Color(0xFF3B82F6), // Investments - Blue
    Color(0xFF8B5CF6), // House Deposit - Purple
    Color(0xFFFECB47), // Holiday Fund - Secondary Amber
    Color(0xFF64748B), // Everyday Spending - Gray
    Color(0xFF06B6D4), // Transport - Cyan
    Color(0xFF84CC16), // Other - Lime
  ];

  // Modern shadows
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x0A009362), // Subtle green tint
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

  // PayDay specific color combinations
  static const List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: Color(0x20009362),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> secondaryShadow = [
    BoxShadow(
      color: Color(0x20FECB47),
      blurRadius: 20,
      offset: Offset(0, 8),
    ),
  ];
}