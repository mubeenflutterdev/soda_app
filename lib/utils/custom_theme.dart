import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soda_bar/const/app_colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.whiteColor,
    // scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.greenColor,
    textTheme: GoogleFonts.montserratTextTheme().copyWith(
      titleLarge: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 60.sp,
        fontWeight: FontWeight.bold,
      ),

      // titleLarge: GoogleFonts.montserrat(

      // ),
      titleMedium: TextStyle(
        color: AppColors.blackColor,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: AppColors.blackColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
    // Optional: Add overrides if needed
    // titleLarge: GoogleFonts.montserrat(
    //   color: AppColors.whiteColor,
    //   fontSize: 60.sp,
    //   fontWeight: FontWeight.bold,
    // ),
    // textTheme: TextTheme(
    //   GoogleFonts.aBeeZeeTextTheme(),
    //   /// title theme for title in app

    //   // /// title theme for suntitle in app

    // ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.whiteColor,
    // scaffoldBackgroundColor: AppColors.whiteColor,
    cardColor: AppColors.greenColor,
    textTheme: TextTheme(
      /// title theme for title in app
      titleLarge: GoogleFonts.montserrat(
        color: AppColors.blackColor,
        fontSize: 60.sp,
        fontWeight: FontWeight.bold,
      ),

      /// title theme for suntitle in app
      titleMedium: GoogleFonts.montserrat(
        color: AppColors.blackColor,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.montserrat(
        color: AppColors.blackColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
