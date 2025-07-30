import 'package:flutter/material.dart';
import 'package:foodfinder/app/modules/multi_color/controller.dart';

import '../constant/app_color.dart';

class AppLightTheme {
  static ThemeData lightTheme(MultiColorController controller) {
    final primary = controller.primaryColor;

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primary,
      scaffoldBackgroundColor: AppColor.whiteColor,
      cardColor: AppColor.cardLColor,
      canvasColor: AppColor.whiteColor,

      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: AppColor.whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColor.whiteColor),
        titleTextStyle: TextStyle(color: AppColor.whiteColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: primary, foregroundColor: AppColor.whiteColor),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: AppColor.whiteColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColor.textBlackColor),
        bodyMedium: TextStyle(color: AppColor.textBlackColor),
        titleSmall: TextStyle(color: AppColor.textGreyLColor),
        titleLarge: TextStyle(color: AppColor.textBlackColor, fontSize: 20, fontWeight: FontWeight.bold),
      ),

      iconTheme: IconThemeData(color: AppColor.iconCLColor),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColor.cardLColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        hintStyle: TextStyle(color: AppColor.textGreyLColor),
      ),

      colorScheme: ColorScheme.light(
        primary: primary,
        surface: AppColor.surfaceCLColor,
        surfaceTint: AppColor.surfaceCLColor,
        onPrimary: AppColor.whiteColor,
        onSurface: AppColor.textBlackColor,
      ),
    );
  }
}
