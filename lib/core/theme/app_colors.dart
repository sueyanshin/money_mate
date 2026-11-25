import 'package:flutter/material.dart';

/// App Color Palette & Semantic Tokens
class AppColors {
  AppColors._();

  // Primary & Emerald Brand Tokens
  static const Color primary = Color(0xFF10B981);
  static const Color primaryDark = Color(0xFF047857);
  static const Color primaryLight = Color(0xFF34D399);
  static const Color primaryMintAccent = Color(0xFFA7F3D0);
  static const Color primaryContainer = Color(0xFFECFDF5);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFF065F46);

  // Secondary & Accent Tokens
  static const Color secondary = Color(0xFF0F766E);
  static const Color secondaryContainer = Color(0xFFCCFBF1);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = Color(0xFF115E59);

  // Surface & Canvas (Light Theme)
  // static const Color surface = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFF8F9FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF1F5F9);
  static const Color surfaceContainer = Color(0xFFE2E8F0);
  static const Color surfaceContainerHigh = Color(0xFFCBD5E1);

  // Text & Neutral Shades
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF64748B);
  static const Color outline = Color(0xFFE2E8F0);
  static const Color outlineVariant = Color(0xFFF1F5F9);

  // Status & Transaction Semantics
  static const Color success = Color(0xFF10B981);
  static const Color successBg = Color(0xFFECFDF5);
  static const Color expense = Color(0xFFE11D48);
  static const Color expenseBg = Color(0xFFFFF1F2);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningBg = Color(0xFFFFFBEB);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoBg = Color(0xFFEFF6FF);

  // Category Accent Colors (Matches SVG Transaction Categories)
  static const Color categoryFood = Color(0xFFF59E0B);
  static const Color categoryGroceries = Color(0xFF10B981);
  static const Color categoryUtilities = Color(0xFF06B6D4);
  static const Color categoryTransit = Color(0xFF3B82F6);
  static const Color categoryHealth = Color(0xFFF43F5E);
  static const Color categoryEntertainment = Color(0xFF8B5CF6);
  static const Color categorySalary = Color(0xFF34D399);
  static const Color categoryInvest = Color(0xFFFBBF24);

  // Myanmar Payment Channel Brand Tones
  static const Color kbzPayBlue = Color(0xFF0052CC);
  static const Color cbBankAmber = Color(0xFFD97706);
  static const Color cashVaultGreen = Color(0xFF10B981);
}

/// Custom Theme Extension for MoneyMate Specific Category & Badge Styling
class MoneyMateThemeExtension extends ThemeExtension<MoneyMateThemeExtension> {
  final Color categoryFood;
  final Color categoryGroceries;
  final Color categoryUtilities;
  final Color categoryTransit;
  final Color categoryHealth;
  final Color categoryEntertainment;
  final Color categorySalary;
  final Color categoryInvest;
  final Color cardShadowColor;

  const MoneyMateThemeExtension({
    required this.categoryFood,
    required this.categoryGroceries,
    required this.categoryUtilities,
    required this.categoryTransit,
    required this.categoryHealth,
    required this.categoryEntertainment,
    required this.categorySalary,
    required this.categoryInvest,
    required this.cardShadowColor,
  });

  @override
  ThemeExtension<MoneyMateThemeExtension> copyWith({
    Color? categoryFood,
    Color? categoryGroceries,
    Color? categoryUtilities,
    Color? categoryTransit,
    Color? categoryHealth,
    Color? categoryEntertainment,
    Color? categorySalary,
    Color? categoryInvest,
    Color? cardShadowColor,
  }) {
    return MoneyMateThemeExtension(
      categoryFood: categoryFood ?? this.categoryFood,
      categoryGroceries: categoryGroceries ?? this.categoryGroceries,
      categoryUtilities: categoryUtilities ?? this.categoryUtilities,
      categoryTransit: categoryTransit ?? this.categoryTransit,
      categoryHealth: categoryHealth ?? this.categoryHealth,
      categoryEntertainment:
          categoryEntertainment ?? this.categoryEntertainment,
      categorySalary: categorySalary ?? this.categorySalary,
      categoryInvest: categoryInvest ?? this.categoryInvest,
      cardShadowColor: cardShadowColor ?? this.cardShadowColor,
    );
  }

  @override
  ThemeExtension<MoneyMateThemeExtension> lerp(
    covariant ThemeExtension<MoneyMateThemeExtension>? other,
    double t,
  ) {
    if (other is! MoneyMateThemeExtension) return this;
    return MoneyMateThemeExtension(
      categoryFood: Color.lerp(categoryFood, other.categoryFood, t)!,
      categoryGroceries: Color.lerp(
        categoryGroceries,
        other.categoryGroceries,
        t,
      )!,
      categoryUtilities: Color.lerp(
        categoryUtilities,
        other.categoryUtilities,
        t,
      )!,
      categoryTransit: Color.lerp(categoryTransit, other.categoryTransit, t)!,
      categoryHealth: Color.lerp(categoryHealth, other.categoryHealth, t)!,
      categoryEntertainment: Color.lerp(
        categoryEntertainment,
        other.categoryEntertainment,
        t,
      )!,
      categorySalary: Color.lerp(categorySalary, other.categorySalary, t)!,
      categoryInvest: Color.lerp(categoryInvest, other.categoryInvest, t)!,
      cardShadowColor: Color.lerp(cardShadowColor, other.cardShadowColor, t)!,
    );
  }
}
