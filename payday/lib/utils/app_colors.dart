import 'package:flutter/material.dart';

class AppColors {
  // Primary brand colors
  static const Color primary = Color(0xFF2E7D32); // Forest Green
  static const Color primaryLight = Color(0xFF66BB6A);
  static const Color primaryDark = Color(0xFF1B5E20);

  // Secondary colors
  static const Color secondary = Color(0xFF4CAF50);
  static const Color accent = Color(0xFFFF7043); // Orange for alerts/actions

  // Background colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFFFFF);

  // Text colors
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);

  // Status colors
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFFF7043);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Category colors for budget visualization
  static const List<Color> categoryColors = [
    Color(0xFF2E7D32), // Savings - Green
    Color(0xFF1976D2), // Bills - Blue
    Color(0xFFFF7043), // Emergency - Orange
    Color(0xFF9C27B0), // Spending - Purple
    Color(0xFFFF5722), // Food - Red Orange
    Color(0xFF795548), // Transport - Brown
    Color(0xFF607D8B), // Other - Blue Grey
  ];
}
