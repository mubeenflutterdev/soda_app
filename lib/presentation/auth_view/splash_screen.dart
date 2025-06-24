import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';
import 'package:soda_bar/presentation/auth_view/sign_in_screen.dart';
import 'package:soda_bar/widgets/buttons/button_component.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.splashImage),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Text(
                "ENJOY \nEVERY SIP",
                style: TextStyle(
                  fontSize: 46.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 15.h),
              child: Text(
                "The ulti4mate refreshing drink\nto enjoy in every festival",
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 230.w, top: 20.h, bottom: 20.h),
              child: ButtonComponent(
                text: "Next",
                borderRadius: 5.r,
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()),
                  );
                },
                weidht: 100.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
