import 'package:flutter/material.dart';
import 'package:hotelino/core/constant/constant.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final baseLight = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorSchemeSeed: Appcolors.primary,
      fontFamily: 'sahel',
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Appcolors.lightText,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
      textTheme: TextTheme(
        //Onboarding screen
        displayLarge: TextStyle(
            fontSize: 24,
            color: Appcolors.lightText,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            fontSize: 17,
            color: Appcolors.lightText,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            fontSize: 16,
            color: Appcolors.lightText,
            fontWeight: FontWeight.w400),

        //hotel ditail
        headlineLarge: TextStyle(
            fontSize: 24,
            color: Appcolors.lightText,
            fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
            fontSize: 20,
            color: Appcolors.lightText,
            fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(
            fontSize: 16,
            color: Appcolors.lightText,
            fontWeight: FontWeight.w400),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Appcolors.lightBorder, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Appcolors.lightBorder, width: 1.5)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Appcolors.lightFocusBorder, width: 1.5),
          ),
          hintStyle: TextStyle(color: Appcolors.lightHint, fontSize: 14),
          labelStyle: TextStyle(
              color: Appcolors.lightText, fontWeight: FontWeight.bold)),
    );

    return baseLight.copyWith(
        colorScheme: baseLight.colorScheme.copyWith(
            primaryFixed: Appcolors.primary,
            outline: Colors.grey[500],
            surfaceContainerLow: Colors.grey[200]),
        inputDecorationTheme: baseLight.inputDecorationTheme
            .copyWith(fillColor: baseLight.colorScheme.surface));
  }

  //----------------------------------dark theme--------------------------------------//

  static ThemeData get darkTheme {
    final baseDark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorSchemeSeed: Appcolors.primary,
      fontFamily: 'sahel',
      appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Appcolors.darkText,
              fontSize: 16,
              fontWeight: FontWeight.w500)),
      textTheme: TextTheme(
        //Onboarding screen
        displayLarge: TextStyle(
            fontSize: 24,
            color: Appcolors.darkText,
            fontWeight: FontWeight.bold),
        displayMedium: TextStyle(
            fontSize: 17,
            color: Appcolors.darkText,
            fontWeight: FontWeight.bold),
        displaySmall: TextStyle(
            fontSize: 16,
            color: Appcolors.darkText,
            fontWeight: FontWeight.w400),

        //hotel ditail
        headlineLarge: TextStyle(
            fontSize: 24,
            color: Appcolors.darkText,
            fontWeight: FontWeight.w600),
        headlineMedium: TextStyle(
            fontSize: 20,
            color: Appcolors.darkText,
            fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(
            fontSize: 16,
            color: Appcolors.darkText,
            fontWeight: FontWeight.w400),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Appcolors.primary,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)))),
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Appcolors.darkInputFill,
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Appcolors.darkBorder, width: 1.5)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Appcolors.darkBorder, width: 1.5)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(color: Appcolors.darkFocusBorder, width: 1.5),
          ),
          hintStyle: TextStyle(color: Appcolors.darkHint, fontSize: 14),
          labelStyle: TextStyle(
              color: Appcolors.darkText, fontWeight: FontWeight.bold)),
    );

    return baseDark.copyWith(
        colorScheme: baseDark.colorScheme.copyWith(
          primaryFixed: Appcolors.primary,
          outline: Colors.grey[500],
        ),
        inputDecorationTheme: baseDark.inputDecorationTheme
            .copyWith(fillColor: baseDark.colorScheme.surface));
  }
}
