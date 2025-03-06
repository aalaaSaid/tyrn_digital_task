import 'package:flutter/material.dart';
import 'package:task_turn_digital/core/utils/app_colors.dart';
import 'package:task_turn_digital/core/utils/text_styles.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
      fontFamily: 'Poppins',
      scaffoldBackgroundColor: AppColors.whiteColor,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: getSmallTextStyle(
          color: AppColors.greyColor
        ),
          prefixIconColor: AppColors.greyColor,
          suffixIconColor: AppColors.greyColor,
          fillColor: AppColors.whiteColor,
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(
              color: AppColors.borderColor,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: AppColors.borderColor,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: AppColors.redColor,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: AppColors.redColor,
            ),
          )),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.blackColor,
        ),
      ));
}