import 'package:flutter/material.dart';
import 'package:amaliyot_oxiringi_oy/core/core.dart';

class Themes {
  static final ThemeData light = ThemeData(
    primaryColor: AppColors.primary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: Fonts.dmSans,
    useMaterial3: true,

    // Define the color scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: Colors.amber,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
    ),

    // AppBar theme
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle:
          TextStyles.bold.copyWith(fontSize: 20, color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    ),

    // Button theme
    buttonTheme: ButtonThemeData(
      padding: const EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      buttonColor: AppColors.primary,
    ),

    // ElevatedButton theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle: TextStyles.medium.copyWith(fontSize: 18),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
    ),

    // Input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      labelStyle: TextStyles.regular.copyWith(color: AppColors.primary),
      hintStyle: TextStyles.regularItalic.copyWith(color: Colors.grey[600]),
    ),

    // Bottom Navigation Bar theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.grey,
      selectedIconTheme: IconThemeData(size: 28),
      unselectedIconTheme: IconThemeData(size: 24),
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
