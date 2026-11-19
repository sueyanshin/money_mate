import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Emerald Wealth Clean Design System
/// Generated from DESIGN.md
class ApppTheme {
  ApppTheme._();

  // ===========================================================================
  // 1. COLOR PALETTE
  // ===========================================================================

  // Core Material 3 & YAML Color Tokens
  static const Color primary = Color(0xFF006C49);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF10B981);
  static const Color onPrimaryContainer = Color(0xFF00422B);
  static const Color inversePrimary = Color(0xFF4EDEA3);

  static const Color primaryFixed = Color(0xFF6FFBBE);
  static const Color primaryFixedDim = Color(0xFF4EDEA3);
  static const Color onPrimaryFixed = Color(0xFF002113);
  static const Color onPrimaryFixedVariant = Color(0xFF005236);

  static const Color secondary = Color(0xFF006C4E);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFF97F5CC);
  static const Color onSecondaryContainer = Color(0xFF007353);

  static const Color secondaryFixed = Color(0xFF97F5CC);
  static const Color secondaryFixedDim = Color(0xFF7BD8B1);
  static const Color onSecondaryFixed = Color(0xFF002115);
  static const Color onSecondaryFixedVariant = Color(0xFF00513A);

  static const Color tertiary = Color(0xFFA83639);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFFFF7979);
  static const Color onTertiaryContainer = Color(0xFF740D18);

  static const Color tertiaryFixed = Color(0xFFFFDAD8);
  static const Color tertiaryFixedDim = Color(0xFFFFB3B0);
  static const Color onTertiaryFixed = Color(0xFF410006);
  static const Color onTertiaryFixedVariant = Color(0xFF881D24);

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  static const Color surface = Color(0xFFF8F9FF);
  static const Color surfaceDim = Color(0xFFCBDBF5);
  static const Color surfaceBright = Color(0xFFF8F9FF);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFEFF4FF);
  static const Color surfaceContainer = Color(0xFFE5EEFF);
  static const Color surfaceContainerHigh = Color(0xFFDCE9FF);
  static const Color surfaceContainerHighest = Color(0xFFD3E4FE);
  static const Color surfaceVariant = Color(0xFFD3E4FE);
  static const Color onSurface = Color(0xFF0B1C30);
  static const Color onSurfaceVariant = Color(0xFF3C4A42);
  static const Color inverseSurface = Color(0xFF213145);
  static const Color inverseOnSurface = Color(0xFFEAF1FF);

  static const Color outline = Color(0xFF6C7A71);
  static const Color outlineVariant = Color(0xFFBBCABF);
  static const Color surfaceTint = Color(0xFF006C49);

  // Semantic Fintech Tokens (Prose Specifications)
  static const Color emeraldPrimary = Color(0xFF10B981);
  static const Color emeraldDark = Color(0xFF047857);
  static const Color emeraldLight = Color(0xFF34D399);
  static const Color mintAccent = Color(0xFFD1FAE5);
  static const Color coralExpense = Color(0xFFF87171);
  static const Color neutralCanvas = Color(0xFFF8FAFC);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF172033);
  static const Color textSecondary = Color(0xFF64748B);
  static const Color borderHairline = Color(0xFFE2E8F0);
  static const Color progressTrack = Color(0xFFF1F5F9);

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,
    primaryFixed: primaryFixed,
    primaryFixedDim: primaryFixedDim,
    onPrimaryFixed: onPrimaryFixed,
    onPrimaryFixedVariant: onPrimaryFixedVariant,
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,
    secondaryFixed: secondaryFixed,
    secondaryFixedDim: secondaryFixedDim,
    onSecondaryFixed: onSecondaryFixed,
    onSecondaryFixedVariant: onSecondaryFixedVariant,
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,
    tertiaryFixed: tertiaryFixed,
    tertiaryFixedDim: tertiaryFixedDim,
    onTertiaryFixed: onTertiaryFixed,
    onTertiaryFixedVariant: onTertiaryFixedVariant,
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,
    surface: surface,
    surfaceDim: surfaceDim,
    surfaceBright: surfaceBright,
    surfaceContainerLowest: surfaceContainerLowest,
    surfaceContainerLow: surfaceContainerLow,
    surfaceContainer: surfaceContainer,
    surfaceContainerHigh: surfaceContainerHigh,
    surfaceContainerHighest: surfaceContainerHighest,
    onSurface: onSurface,
    onSurfaceVariant: onSurfaceVariant,
    outline: outline,
    outlineVariant: outlineVariant,
    shadow: Color(0xFF172033),
    scrim: Color(0xFF0B1C30),
    inverseSurface: inverseSurface,
    onInverseSurface: inverseOnSurface,
    inversePrimary: inversePrimary,
    surfaceTint: surfaceTint,
  );

  // ===========================================================================
  // 2. SPACING & RADII CONSTANTS
  // ===========================================================================

  static const double spaceXs = 4.0; // 0.25rem
  static const double spaceSm = 8.0; // 0.5rem
  static const double spaceMd = 16.0; // 1rem
  static const double spaceLg = 24.0; // 1.5rem
  static const double spaceXl = 32.0; // 2rem

  static const double gutter = 16.0;
  static const double marginMobile = 16.0;
  static const double marginTablet = 32.0;

  static const double radiusSm = 4.0; // 0.25rem
  static const double radiusDefault = 8.0; // 0.5rem
  static const double radiusMd = 12.0; // 0.75rem (Inputs, icon badges)
  static const double radiusLg = 16.0; // 1rem (Cards / rounded-2xl)
  static const double radiusXl = 24.0; // 1.5rem (Sheets)
  static const double radiusFull = 9999.0; // Pill buttons & chips

  // ===========================================================================
  // 3. ELEVATION & AMBIENT SHADOWS
  // ===========================================================================

  /// Level 1: Module Cards & Sheets
  static const List<BoxShadow> shadowLevel1 = [
    BoxShadow(
      color: Color(0x0A172033), // rgba(23, 32, 51, 0.04)
      blurRadius: 20,
      spreadRadius: -2,
      offset: Offset(0, 4),
    ),
    BoxShadow(
      color: Color(0x05172033), // rgba(23, 32, 51, 0.02)
      blurRadius: 6,
      spreadRadius: -1,
      offset: Offset(0, 2),
    ),
  ];

  /// Level 2: Interactive Floating Elements & Bottom Bar
  static const List<BoxShadow> shadowLevel2 = [
    BoxShadow(
      color: Color(0x14172033), // rgba(23, 32, 51, 0.08)
      blurRadius: 30,
      spreadRadius: -4,
      offset: Offset(0, 10),
    ),
    BoxShadow(
      color: Color(0x0A172033), // rgba(23, 32, 51, 0.04)
      blurRadius: 12,
      spreadRadius: -2,
      offset: Offset(0, 4),
    ),
  ];

  /// Level 3: Floating Action Button (Emerald-tinted aura)
  static const List<BoxShadow> shadowFab = [
    BoxShadow(
      color: Color(0x6110B981), // rgba(16, 185, 129, 0.38)
      blurRadius: 24,
      spreadRadius: -2,
      offset: Offset(0, 8),
    ),
    BoxShadow(
      color: Color(0x3310B981), // rgba(16, 185, 129, 0.20)
      blurRadius: 8,
      spreadRadius: -1,
      offset: Offset(0, 4),
    ),
  ];

  // ===========================================================================
  // 4. TYPOGRAPHY (Plus Jakarta Sans & Inter with Tabular Figures)
  // ===========================================================================

  static const String fontDisplay = 'Plus Jakarta Sans';
  static const String fontBody = 'Inter';
  static const List<FontFeature> tabularFigures = [
    FontFeature.tabularFigures(),
  ];

  static const TextStyle displayCurrency = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 36,
    fontWeight: FontWeight.w700,
    height: 44 / 36,
    letterSpacing: -0.03 * 36, // -1.08
    color: textPrimary,
    fontFeatures: tabularFigures,
  );

  static const TextStyle displayCurrencyMobile = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 38 / 30,
    letterSpacing: -0.02 * 30, // -0.60
    color: textPrimary,
    fontFeatures: tabularFigures,
  );

  static const TextStyle headlineLg = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 32 / 24,
    letterSpacing: -0.02 * 24, // -0.48
    color: textPrimary,
  );

  static const TextStyle headlineMd = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
    letterSpacing: -0.01 * 20, // -0.20
    color: textPrimary,
  );

  static const TextStyle headlineSm = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
    color: textPrimary,
  );

  static const TextStyle bodyLg = TextStyle(
    fontFamily: fontBody,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: textPrimary,
  );

  static const TextStyle bodyMd = TextStyle(
    fontFamily: fontBody,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
    color: textPrimary,
  );

  static const TextStyle bodySm = TextStyle(
    fontFamily: fontBody,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: textSecondary,
  );

  static const TextStyle labelLg = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.01 * 14, // 0.14
    color: textPrimary,
  );

  static const TextStyle labelMd = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    letterSpacing: 0.02 * 12, // 0.24
    color: textPrimary,
  );

  static const TextStyle labelSm = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    height: 14 / 11,
    letterSpacing: 0.04 * 11, // 0.44
    color: textSecondary,
  );

  static const TextStyle numberData = TextStyle(
    fontFamily: fontBody,
    fontSize: 15,
    fontWeight: FontWeight.w600,
    height: 20 / 15,
    letterSpacing: -0.01 * 15, // -0.15
    color: textPrimary,
    fontFeatures: tabularFigures,
  );

  static TextTheme get textTheme => const TextTheme(
    displayLarge: displayCurrency,
    displayMedium: displayCurrencyMobile,
    displaySmall: headlineLg,
    headlineLarge: headlineLg,
    headlineMedium: headlineMd,
    headlineSmall: headlineSm,
    titleLarge: headlineSm,
    titleMedium: labelLg,
    titleSmall: labelMd,
    bodyLarge: bodyLg,
    bodyMedium: bodyMd,
    bodySmall: bodySm,
    labelLarge: labelLg,
    labelMedium: labelMd,
    labelSmall: labelSm,
  );

  // ===========================================================================
  // 5. MAIN THEME DATA
  // ===========================================================================

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: lightColorScheme,
      scaffoldBackgroundColor: neutralCanvas,
      fontFamily: fontBody,
      textTheme: textTheme,
      dividerColor: borderHairline,

      // App Bar
      appBarTheme: const AppBarTheme(
        backgroundColor: neutralCanvas,
        foregroundColor: textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: headlineMd,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),

      // Cards (Pure white, rounded-2xl / 16px, hairline border)
      cardTheme: CardThemeData(
        color: pureWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusLg),
          side: const BorderSide(color: borderHairline, width: 1),
        ),
      ),

      // Primary Action Buttons (Full pill, 48-52px height, #10B981 -> #047857 pressed)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(0, 50)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          ),
          shape: WidgetStateProperty.all(const StadiumBorder()),
          elevation: WidgetStateProperty.all(0),
          textStyle: WidgetStateProperty.all(labelLg),
          foregroundColor: WidgetStateProperty.all(pureWhite),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return emeraldPrimary.withValues(alpha: 0.4);
            }
            if (states.contains(WidgetState.pressed)) {
              return emeraldDark;
            }
            return emeraldPrimary;
          }),
        ),
      ),

      // Secondary / Ghost Action Buttons (Full pill, #D1FAE5 fill, #047857 text, zero border)
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(0, 48)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          shape: WidgetStateProperty.all(const StadiumBorder()),
          elevation: WidgetStateProperty.all(0),
          textStyle: WidgetStateProperty.all(labelLg),
          foregroundColor: WidgetStateProperty.all(emeraldDark),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.pressed)) {
              return secondaryContainer;
            }
            return mintAccent;
          }),
        ),
      ),

      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.all(const Size(0, 48)),
          padding: WidgetStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
          shape: WidgetStateProperty.all(const StadiumBorder()),
          side: WidgetStateProperty.all(
            const BorderSide(color: borderHairline, width: 1),
          ),
          textStyle: WidgetStateProperty.all(labelLg),
          foregroundColor: WidgetStateProperty.all(textPrimary),
          backgroundColor: WidgetStateProperty.all(pureWhite),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(labelLg),
          foregroundColor: WidgetStateProperty.all(emeraldDark),
          shape: WidgetStateProperty.all(const StadiumBorder()),
        ),
      ),

      // Floating Action Button (56x56 circular, #10B981)
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: emeraldPrimary,
        foregroundColor: pureWhite,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: CircleBorder(),
        sizeConstraints: BoxConstraints.tightFor(width: 56, height: 56),
      ),

      // Chips & Pill Selectors
      chipTheme: ChipThemeData(
        backgroundColor: pureWhite,
        selectedColor: mintAccent,
        disabledColor: neutralCanvas,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        labelPadding: EdgeInsets.zero,
        showCheckmark: false,
        shape: const StadiumBorder(),
        side: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return BorderSide.none;
          }
          return const BorderSide(color: borderHairline, width: 1);
        }),
        labelStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return labelMd.copyWith(
              color: emeraldDark,
              fontWeight: FontWeight.w700,
            );
          }
          return labelMd.copyWith(color: textSecondary);
        }),
      ),

      // Form Input Fields (Height 52px, #F8FAFC fill, #E2E8F0 border, 12px radius, #10B981 focus)
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: neutralCanvas,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 15,
        ),
        constraints: const BoxConstraints(minHeight: 52),
        hintStyle: bodyMd.copyWith(color: textSecondary),
        labelStyle: bodyMd.copyWith(color: textSecondary),
        prefixStyle: numberData.copyWith(color: textPrimary),
        suffixStyle: bodyMd.copyWith(color: textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: borderHairline, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: borderHairline, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: emeraldPrimary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          borderSide: const BorderSide(color: error, width: 2),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: pureWhite.withValues(alpha: 0.95),
        selectedItemColor: emeraldPrimary,
        unselectedItemColor: textSecondary,
        selectedLabelStyle: labelSm.copyWith(color: emeraldPrimary),
        unselectedLabelStyle: labelSm.copyWith(color: textSecondary),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: pureWhite.withValues(alpha: 0.95),
        surfaceTintColor: Colors.transparent,
        indicatorColor: mintAccent,
        elevation: 0,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const IconThemeData(color: emeraldPrimary, size: 24);
          }
          return const IconThemeData(color: textSecondary, size: 24);
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return labelSm.copyWith(color: emeraldPrimary);
          }
          return labelSm.copyWith(color: textSecondary);
        }),
      ),

      // Bottom Sheets & Modals
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: pureWhite,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(radiusXl)),
        ),
      ),

      // Progress Indicators (Rounded caps, #F1F5F9 track, #10B981 fill)
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: emeraldPrimary,
        linearTrackColor: progressTrack,
        circularTrackColor: progressTrack,
        linearMinHeight: 8,
        borderRadius: BorderRadius.circular(radiusFull),
      ),

      // Dividers
      dividerTheme: const DividerThemeData(
        color: borderHairline,
        thickness: 1,
        space: 1,
      ),

      // Custom Fintech Theme Extension
      extensions: const <ThemeExtension<dynamic>>[FintechThemeExtension.light],
    );
  }
}

// =============================================================================
// 6. FINTECH THEME EXTENSION (Semantic Colors, Gradients & Shadows)
// =============================================================================

@immutable
class FintechThemeExtension extends ThemeExtension<FintechThemeExtension> {
  const FintechThemeExtension({
    required this.incomeColor,
    required this.incomeSurface,
    required this.expenseColor,
    required this.expenseSurface,
    required this.budgetHealthyGradient,
    required this.budgetWarningColor,
    required this.progressTrackColor,
    required this.cardShadow,
    required this.floatingShadow,
    required this.fabShadow,
    required this.numberDataStyle,
    required this.displayCurrencyStyle,
    required this.displayCurrencyMobileStyle,
  });

  final Color incomeColor;
  final Color incomeSurface;
  final Color expenseColor;
  final Color expenseSurface;
  final LinearGradient budgetHealthyGradient;
  final Color budgetWarningColor;
  final Color progressTrackColor;
  final List<BoxShadow> cardShadow;
  final List<BoxShadow> floatingShadow;
  final List<BoxShadow> fabShadow;
  final TextStyle numberDataStyle;
  final TextStyle displayCurrencyStyle;
  final TextStyle displayCurrencyMobileStyle;

  static const FintechThemeExtension light = FintechThemeExtension(
    incomeColor: ApppTheme.emeraldPrimary,
    incomeSurface: ApppTheme.mintAccent,
    expenseColor: ApppTheme.coralExpense,
    expenseSurface: ApppTheme.tertiaryFixed,
    budgetHealthyGradient: LinearGradient(
      colors: [ApppTheme.emeraldPrimary, ApppTheme.emeraldLight],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
    budgetWarningColor: ApppTheme.coralExpense,
    progressTrackColor: ApppTheme.progressTrack,
    cardShadow: ApppTheme.shadowLevel1,
    floatingShadow: ApppTheme.shadowLevel2,
    fabShadow: ApppTheme.shadowFab,
    numberDataStyle: ApppTheme.numberData,
    displayCurrencyStyle: ApppTheme.displayCurrency,
    displayCurrencyMobileStyle: ApppTheme.displayCurrencyMobile,
  );

  @override
  FintechThemeExtension copyWith({
    Color? incomeColor,
    Color? incomeSurface,
    Color? expenseColor,
    Color? expenseSurface,
    LinearGradient? budgetHealthyGradient,
    Color? budgetWarningColor,
    Color? progressTrackColor,
    List<BoxShadow>? cardShadow,
    List<BoxShadow>? floatingShadow,
    List<BoxShadow>? fabShadow,
    TextStyle? numberDataStyle,
    TextStyle? displayCurrencyStyle,
    TextStyle? displayCurrencyMobileStyle,
  }) {
    return FintechThemeExtension(
      incomeColor: incomeColor ?? this.incomeColor,
      incomeSurface: incomeSurface ?? this.incomeSurface,
      expenseColor: expenseColor ?? this.expenseColor,
      expenseSurface: expenseSurface ?? this.expenseSurface,
      budgetHealthyGradient:
          budgetHealthyGradient ?? this.budgetHealthyGradient,
      budgetWarningColor: budgetWarningColor ?? this.budgetWarningColor,
      progressTrackColor: progressTrackColor ?? this.progressTrackColor,
      cardShadow: cardShadow ?? this.cardShadow,
      floatingShadow: floatingShadow ?? this.floatingShadow,
      fabShadow: fabShadow ?? this.fabShadow,
      numberDataStyle: numberDataStyle ?? this.numberDataStyle,
      displayCurrencyStyle: displayCurrencyStyle ?? this.displayCurrencyStyle,
      displayCurrencyMobileStyle:
          displayCurrencyMobileStyle ?? this.displayCurrencyMobileStyle,
    );
  }

  @override
  FintechThemeExtension lerp(
    covariant ThemeExtension<FintechThemeExtension>? other,
    double t,
  ) {
    if (other is! FintechThemeExtension) return this;
    return FintechThemeExtension(
      incomeColor: Color.lerp(incomeColor, other.incomeColor, t)!,
      incomeSurface: Color.lerp(incomeSurface, other.incomeSurface, t)!,
      expenseColor: Color.lerp(expenseColor, other.expenseColor, t)!,
      expenseSurface: Color.lerp(expenseSurface, other.expenseSurface, t)!,
      budgetHealthyGradient: LinearGradient.lerp(
        budgetHealthyGradient,
        other.budgetHealthyGradient,
        t,
      )!,
      budgetWarningColor: Color.lerp(
        budgetWarningColor,
        other.budgetWarningColor,
        t,
      )!,
      progressTrackColor: Color.lerp(
        progressTrackColor,
        other.progressTrackColor,
        t,
      )!,
      cardShadow: BoxShadow.lerpList(cardShadow, other.cardShadow, t)!,
      floatingShadow: BoxShadow.lerpList(
        floatingShadow,
        other.floatingShadow,
        t,
      )!,
      fabShadow: BoxShadow.lerpList(fabShadow, other.fabShadow, t)!,
      numberDataStyle: TextStyle.lerp(
        numberDataStyle,
        other.numberDataStyle,
        t,
      )!,
      displayCurrencyStyle: TextStyle.lerp(
        displayCurrencyStyle,
        other.displayCurrencyStyle,
        t,
      )!,
      displayCurrencyMobileStyle: TextStyle.lerp(
        displayCurrencyMobileStyle,
        other.displayCurrencyMobileStyle,
        t,
      )!,
    );
  }
}

/// Convenient BuildContext accessor for fintech tokens
extension FintechThemeContext on BuildContext {
  FintechThemeExtension get fintechTheme =>
      Theme.of(this).extension<FintechThemeExtension>() ??
      FintechThemeExtension.light;
}
