import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_size.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: false,
    fontFamily: 'custom_font',
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    /// APPBAR THEME
    appBarTheme: AppBarTheme(
      elevation: 0.5,
      centerTitle: false,
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        color: AppColors.primary,
        fontFamily: 'custom_font',
        fontWeight: FontWeight.w700,
        fontSize: AppSize.fontSize(16),
      ),
      titleSpacing: AppSize.getHorizontalSize(20),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(color: AppColors.primary),
    ),

    /// TEXT FORM FIELD THEME
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      hintStyle: TextStyle(
        height: 1.6,
        color: AppColors.grey,
        fontWeight: FontWeight.w600,
        fontSize: AppSize.fontSize(14),
      ),
      labelStyle: TextStyle(
        height: 1.6,
        color: AppColors.grey,
        fontWeight: FontWeight.w600,
        fontSize: AppSize.fontSize(14),
      ),
      helperStyle: TextStyle(
        height: 1.6,
        color: AppColors.grey,
        fontWeight: FontWeight.w600,
        fontSize: AppSize.fontSize(14),
      ),
      fillColor: AppColors.white,
      contentPadding: AppSize.padding(horizontal: 18, vertical: 12),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(AppSize.getSize(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(AppSize.getSize(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(AppSize.getSize(8)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(AppSize.getSize(8)),
      ),
    ),
  );
}
