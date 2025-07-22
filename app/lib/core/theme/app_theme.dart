import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getTheme(TextScaler textScaler) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      textTheme: getTextTheme(textScaler),
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          iconSize: WidgetStatePropertyAll(textScaler.scale(28)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: TextStyle(fontSize: textScaler.scale(17)),
        unselectedLabelStyle: TextStyle(fontSize: textScaler.scale(17)),
        selectedIconTheme: IconThemeData(size: textScaler.scale(28)),
        unselectedIconTheme: IconThemeData(size: textScaler.scale(28)),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: textScaler.scale(16),
              vertical: textScaler.scale(8),
            )
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: textScaler.scale(16)),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: textScaler.scale(16),
              vertical: textScaler.scale(8),
          ),
          ),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: textScaler.scale(16)),
          )
        )
      )
    );
  }

  static TextTheme getTextTheme(TextScaler textScaler) {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: textScaler.scale(22),
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: textScaler.scale(20),
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: textScaler.scale(18),
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: textScaler.scale(18),
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: TextStyle(
        fontSize: textScaler.scale(16),
        fontWeight: FontWeight.normal,
      ),
      bodySmall: TextStyle(
        fontSize: textScaler.scale(14),
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        fontSize: textScaler.scale(12),
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
      labelMedium: TextStyle(
        fontSize: textScaler.scale(10),
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
      labelSmall: TextStyle(
        fontSize: textScaler.scale(8),
        fontWeight: FontWeight.normal,
        color: Colors.grey,
      ),
    );
  }
}
