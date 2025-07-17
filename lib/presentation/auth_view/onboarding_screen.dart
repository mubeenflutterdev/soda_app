// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';

import 'package:soda_bar/provider/ui_provider/onboarding_provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var controler = PageController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnboardingProvider>(context);
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: SizedBox(
              child: PageView(
                controller: controler,
                children: [
                  /// This is 1st view
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 50.h),
                          SizedBox(
                            height: 300.h,
                            // width: 300.h,
                            child: Image.asset(
                              AppImages.sodaBottleImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.w,
                              vertical: 30.h,
                            ),
                            child: Text(
                              'ENJOY EVERY SIP',
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 95.w,
                              vertical: 20,
                            ),
                            child: Text(
                              'The ultimate refreshing drink to enjoy in every festival',
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// this is 2nd view
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 70.h),
                          SizedBox(
                            height: 320,
                            // width: 300,
                            child: Image.asset(
                              AppImages.smallChelly,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.w,
                              vertical: 50.h,
                            ),
                            child: Text(
                              'Come here together',
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 95.w),
                            child: Text(
                              'Cool sips, no matter the season.Just come to enjoy',
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// this is 3rd view
                  SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 50.h),
                          SizedBox(
                            height: 300.h,
                            // width: 300.h,
                            child: Image.asset(
                              AppImages.sodaBottleImage,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 50.w,
                              vertical: 30.h,
                            ),
                            child: Text(
                              'Name of Qulaity',
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 30.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 95.w,
                              vertical: 20,
                            ),
                            child: Text(
                              'Only trusted items Surved here for youre health ',
                              style: GoogleFonts.montserrat(
                                color: AppColors.whiteColor,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: SmoothPageIndicator(
                      controller: controler,
                      count: 3,
                      effect: WormEffect(
                        dotColor: AppColors.whiteColor,
                        activeDotColor: AppColors.green,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w, top: 0),
                    child: GestureDetector(
                      onTap: () {
                        provider.setOnboardingSeen(context);
                      },
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 100.w,
                              top: 10.h,
                              bottom: 10.h,
                            ),
                            child: Container(
                              width: 150.w,
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
                                  Icons.keyboard_double_arrow_right_rounded,
                                  size: 16.h,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),

                          /// 2nd button
                          Padding(
                            padding: EdgeInsets.only(
                              left: 100.w,
                              top: 10.h,
                              right: 10.w,
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
                                    "Next",
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                    ),
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
          ),
        ],
      ),
    );
  }
}
