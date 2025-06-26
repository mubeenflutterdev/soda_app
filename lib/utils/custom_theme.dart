import 'package:flutter/material.dart';
import 'package:soda_bar/const/app_colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.greenColor,
    textTheme: TextTheme(titleLarge: TextStyle()),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.greenColor,
  );
}
