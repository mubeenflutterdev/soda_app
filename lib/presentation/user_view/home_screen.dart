import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Column(children: [DashBoardComponent()])),
    );
  }
}

/////    dashboard component here
class DashBoardComponent extends StatelessWidget {
  const DashBoardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 15.w,
        top: 40.h,
        bottom: 10.h,
      ),
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          gradient: LinearGradient(
            colors: [
              Colors.black,
              // const Color.fromARGB(255, 158, 238, 127),
              const Color.fromARGB(255, 36, 219, 195),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20.h,
              left: 20.w,
              child: Text(
                '30% off',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Positioned(
              bottom: 50.h,
              left: 20.w,
              child: Text(
                'The Holi\nOffer',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                  color: AppColors.primaryColor,
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              left: 20.w,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  child: Text('Buy Now'),
                ),
              ),
            ),

            Positioned(
              right: 10.w,
              child: Image.asset(AppImages.sodaBottleImage, height: 200),
            ),
          ],
        ),
      ),
    );
  }
}
