import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData light = ThemeData(
    bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFFEDEADE),
        surfaceTintColor: Color(0xFFFEFEE2)),
    dividerTheme: DividerThemeData(
      color: const Color(0xFF8592AD).withOpacity(0.3),
    ),
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      background: Color(0xFFEFF3FB),
      onBackground: Color(0xFFFEFEE2),
      primary: Color(0xFF7FC37E),
      primaryContainer: Color(0xFFF2994A),
      onPrimary: Color(0xFFEAF2F6),
      secondary: Color(0xFF7FC37E),
      onSecondary: Color(0xFFEAF2F6),
      tertiary: Color(0xFF0A255C),
      onTertiary: Color(0xFFEAF2F6),
      surface: Colors.white,
      surfaceVariant: Color(0xFF8592AD),
      onSurface: Color(0xFF525F7A),
      error: Color(0xFFCE0E2D),
      onError: Colors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: Colors.transparent,
    highlightColor: Colors.grey.shade300,
    scaffoldBackgroundColor: const Color(0xFF333333),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.white.withAlpha(200),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black87),
    ),
    fontFamily: 'PT_Sans',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 40,
        letterSpacing: -0.02,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        letterSpacing: -0.02,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        letterSpacing: -0.02,
      ),
      bodyLarge: TextStyle(
        fontSize: 15,
        letterSpacing: -0.02,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        letterSpacing: -0.02,
      ),
      bodySmall: TextStyle(
        fontSize: 11,
        letterSpacing: -0.02,
      ),
      labelSmall: TextStyle(
        fontSize: 9,
        letterSpacing: -0.02,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF0A255C),
      size: 20,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );

  /*  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      background: const Color(0xFF141414),
      onBackground: Colors.white,
      primary: Colors.blue,
      onPrimary: Colors.white,
      secondary: Colors.lightBlue,
      onSecondary: Colors.black,
      surface: Colors.grey.shade900,
      onSurface: Colors.grey,
      error: Colors.red,
      onError: Colors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    splashColor: Colors.transparent,
    highlightColor: Colors.grey.shade800,
    scaffoldBackgroundColor: const Color(0xFF141414),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.black.withAlpha(180),
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white70),
    ),
    fontFamily: 'Montserrat',
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        headline2: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        headline3: TextStyle(fontSize: 18, color: Colors.white),
        headline4: TextStyle(fontSize: 16, color: Colors.white),
        headline5: TextStyle(fontSize: 22, color: Colors.white),
        headline6: TextStyle(fontSize: 16, color: Colors.white),
        subtitle1: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        subtitle2: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText1: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText2: TextStyle(fontSize: 12, color: Colors.white),
        labelMedium: TextStyle(fontSize: 12, color: Colors.white),
        button: TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black)),
    iconTheme: IconThemeData(color: Colors.blue.shade100),
    cardTheme: CardTheme(
      color: Colors.grey.shade900,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ); */
}
