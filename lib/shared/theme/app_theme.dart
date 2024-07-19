import 'package:flutter/material.dart';
import 'package:flutter_ecogrow_customer/gen/fonts.gen.dart';

import 'package:flutter_ecogrow_customer/shared/theme/app_color.dart';

class AppTheme {
  static ThemeData getAppTheme() {
    return ThemeData(
      fontFamily: FontFamily.kantumruyPro,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          color: AppColors.blackColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.primary,
        ),

        iconTheme: IconThemeData(
          color: AppColors.primary,
        ),
        backgroundColor: AppColors.backgroundColor,
      ),
      cardTheme: const CardTheme(
        color: AppColors.backgroundColor,
      ),
      primaryColor: AppColors.primary,
      highlightColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.blackColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.blackColor,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.blackColor,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            AppColors.backgroundColor,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            AppColors.backgroundColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ),
      // toggleButtonsTheme: ToggleButtonsThemeData(
      //   selectedColor: AppColor.BODY_COLOR,
      //   fillColor: AppColor.BODY_COLOR.withOpacity(0.1),
      //   textStyle: const TextStyle(color: AppColor.WHITE),
      //   selectedBorderColor: AppColor.BODY_COLOR,
      //   borderRadius: BorderRadius.circular(8.0),
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            AppColors.primary,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            AppColors.backgroundColor,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primary,
        onPrimary: AppColors.primary,
        secondary: AppColors.secondaryColor,
        onSecondary: AppColors.secondaryColor,
        surface: AppColors.backgroundColor,
        onSurface: AppColors.backgroundColor,
        error: Colors.red,
        onError: Colors.red,
        background: AppColors.backgroundColor,
        onBackground: AppColors.backgroundColor,
        brightness: Brightness.light,
      ),
    );
  }
}
