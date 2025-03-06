import 'package:flutter/material.dart';
import 'package:task_turn_digital/core/utils/app_colors.dart';

TextStyle getTitleTextStyle({double fontSize = 35, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? AppColors.blackColor,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold
  );
}
TextStyle getSubTitleTextStyle({double fontSize = 24, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? AppColors.blackColor,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold
  );
}

TextStyle getBodyTextStyle({double fontSize = 22, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? AppColors.blackColor,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500
  );
}

TextStyle getSmallTextStyle({double fontSize = 15, Color? color}) {
  return TextStyle(
    fontSize: fontSize,
    color: color ?? AppColors.blackColor,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400
  );
}