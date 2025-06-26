import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_icons.dart';
import 'package:soda_bar/const/app_images.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.splashImage),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: Text(
                "ENJOY EVERY SIP",
                style: theme.textTheme.headlineLarge,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Text(
                "The ulti4mate refreshing drink to enjoy in every festival",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20.h, bottom: 0, left: 30),
              child: Row(
                children: [
                  SizedBox(width: 20),

                  Icon(
                    Icons.circle,
                    color: AppColors.buttonBackGround,
                    size: 15.r,
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.circle, color: AppColors.whiteColor, size: 15.r),
                  SizedBox(width: 5),

                  Icon(Icons.circle, color: AppColors.whiteColor, size: 15.r),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w, top: 0),
              child: GestureDetector(
                onTap: () {
                  print(
                    ',,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,',
                  );
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 220.w,
                        top: 20.h,
                        bottom: 20.h,
                      ),
                      child: Container(
                        width: 200.w,
                        height: 47.h,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: AppColors.buttonBackGround,
                          ),
                          borderRadius: BorderRadius.circular(40.r),
                          color: AppColors.blackColor,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 70.w),
                          child: Icon(
                            AppIcons.righttrrow,
                            size: 16.h,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),

                    /// 2nd button
                    Padding(
                      padding: EdgeInsets.only(
                        left: 220.w,
                        top: 20.h,
                        right: 20.w,
                        bottom: 20.h,
                      ),
                      child: Container(
                        width: 80,
                        height: 47.h,

                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: AppColors.buttonBackGround,
                          ),
                          borderRadius: BorderRadius.circular(40.r),
                          color: AppColors.buttonBackGround,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(),
                          child: Center(
                            child: Text(
                              "Buy",
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
