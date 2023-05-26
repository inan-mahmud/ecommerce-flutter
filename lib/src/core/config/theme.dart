import 'package:ecommerce_flutter/src/core/config/app_sizes.dart';
import 'package:ecommerce_flutter/src/core/config/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData dark = ThemeData(
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
      titleTextStyle: TextStyle(
        color: AppColors.appBarColor,
        fontWeight: FontWeight.bold,
        fontSize: Sizes.p24,
      ),
      centerTitle: true,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: AppColors.whiteColor,
      backgroundColor: AppColors.purpleColor,
      contentTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    focusColor: Colors.black,
    primaryColor: AppColors.greenColor,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Colors.blue),
      hintStyle: TextStyle(color: Colors.grey),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: AppColors.whiteColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.greyColor,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.whiteColor,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.greyColor,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: Colors.white, fontSize: 36, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(
          color: Colors.white, fontSize: 34, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(
          color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(
          color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(
          color: Colors.white, fontSize: 19, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 14,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 14,
          fontWeight: FontWeight.normal),
      titleSmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 14,
          fontWeight: FontWeight.normal),
    ),
  );

   static final ThemeData light = ThemeData(
    appBarTheme: const AppBarTheme(
      color: AppColors.appBarColor,
      titleTextStyle: TextStyle(
        color: AppColors.appBarColor,
        fontWeight: FontWeight.bold,
        fontSize: Sizes.p24,
      ),
      centerTitle: true,
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: AppColors.whiteColor,
      backgroundColor: AppColors.purpleColor,
      contentTextStyle: TextStyle(
        color: Colors.white,
      ),
    ),
    focusColor: Colors.black,
    primaryColor: AppColors.greenColor,
    inputDecorationTheme: const InputDecorationTheme(
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Colors.blue),
      hintStyle: TextStyle(color: Colors.grey),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: AppColors.whiteColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.greyColor,
      ),
      selectedLabelStyle: TextStyle(
        color: AppColors.whiteColor,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColors.greyColor,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: AppColors.blackColor, fontSize: 36, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(
          color: AppColors.blackColor, fontSize: 34, fontWeight: FontWeight.w400),
      displaySmall: TextStyle(
          color: AppColors.blackColor, fontSize: 22, fontWeight: FontWeight.w500),
      headlineMedium: TextStyle(
          color: AppColors.blackColor, fontSize: 14, fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(
          color: AppColors.blackColor, fontSize: 19, fontWeight: FontWeight.w700),
      titleLarge: TextStyle(
          color: AppColors.blackColor, fontSize: 18, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.w700),
      titleMedium: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.normal),
      titleSmall: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 14,
          fontWeight: FontWeight.normal),
    ),
  );
}
