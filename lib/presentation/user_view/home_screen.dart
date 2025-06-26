// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';
import 'package:soda_bar/provider/ui_provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProvider = context.read<HomeProvider>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashBoardComponent(),
              SizedBox(height: 30.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                ////
                child: Row(
                  children: [
                    SizedBox(width: 20.w),

                    CategroiesComponent(
                      isTap: true,
                      image: AppImages.logo_1,
                      text: '1 Pack',
                      ontap: () {
                        setState(() {});
                      },
                    ),
                    SizedBox(width: 20.w),
                    CategroiesComponent(
                      isTap: false,
                      image: AppImages.logo_2,
                      text: '2 Pack',
                      ontap: () {
                        setState(() {});
                      },
                    ),
                    SizedBox(width: 20.w),

                    CategroiesComponent(
                      isTap: false,
                      image: AppImages.logo_4,
                      text: '4 Pack',
                      ontap: () {
                        setState(() {});
                      },
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.h, left: 20.w, bottom: 10.h),
                child: Text(
                  'All Flavours',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      /// first column of products
                      Column(
                        children: [
                          ProductDasboard(
                            img: AppImages.smallSoda,
                            name: 'Cool Berry',
                            price: 180,
                          ),
                          SizedBox(height: 10.h),
                          ProductDasboard(
                            img: AppImages.smallChelly,
                            name: 'Cool Chelly',
                            price: 230,
                          ),
                          ProductDasboard(
                            img: AppImages.smallChelly,
                            name: 'Cool Berry',
                            price: 180,
                          ),
                          SizedBox(height: 10.h),
                          ProductDasboard(
                            img: AppImages.smallSoda,
                            name: 'Cool Chelly',
                            price: 230,
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w),

                      /// second column of products
                      Column(
                        children: [
                          ProductDasboard(
                            img: AppImages.smallChelly,
                            name: 'Cool Berry',
                            price: 180,
                          ),
                          SizedBox(height: 10.h),
                          ProductDasboard(
                            img: AppImages.smallSoda,
                            name: 'Cool Chelly',
                            price: 230,
                          ),
                          ProductDasboard(
                            img: AppImages.smallSoda,
                            name: 'Cool Berry',
                            price: 180,
                          ),
                          SizedBox(height: 10.h),
                          ProductDasboard(
                            img: AppImages.smallChelly,
                            name: 'Cool Chelly',
                            price: 230,
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
              Colors.black,
              // const Color.fromARGB(255, 158, 238, 127),
              const Color.fromARGB(255, 45, 53, 52),
              const Color.fromARGB(255, 36, 219, 195),
            ],
          ),
        ),
        child: Stack(
          children: [
            /// background image here
            Positioned(
              top: 7.h,
              left: 20.w,
              child: Image.asset(AppImages.dashboardtext),
            ),

            /// 1st heading here
            Positioned(
              top: 30.h,
              left: 20.w,
              child: Text(
                '30% off',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.whiteColor,
                ),
              ),
            ),

            /// 2nd heading here
            Positioned(
              bottom: 50.h,
              left: 20.w,
              child: Text(
                'The Holi\nOffer',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,

                  color: AppColors.whiteColor,
                ),
              ),
            ),

            /// buy now button here
            Positioned(
              bottom: 10.h,
              left: 20.w,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 6.h,
                  ),
                  child: Text('Buy Now'),
                ),
              ),
            ),
            ////// soda bottle image here
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

/// categroies component here
class CategroiesComponent extends StatefulWidget {
  String image;
  String text;
  VoidCallback ontap;
  bool isTap = false;
  CategroiesComponent({
    super.key,
    required this.image,
    required this.text,
    required this.ontap,
    required this.isTap,
  });

  @override
  State<CategroiesComponent> createState() => _CategroiesComponentState();
}

class _CategroiesComponentState extends State<CategroiesComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: widget.isTap == true
              ? AppColors.buttonBackGround
              : AppColors.whiteColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16),
          child: Row(
            children: [
              Image.asset(widget.image),
              SizedBox(width: 8.w),
              Text(widget.text),
            ],
          ),
        ),
      ),
    );
  }
}

/// product dashboard component
class ProductDasboard extends StatelessWidget {
  String img;
  String name;
  int price;
  ProductDasboard({
    super.key,
    required this.img,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.w,
      decoration: BoxDecoration(color: AppColors.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset(img, height: 150)),
          Padding(
            padding: EdgeInsets.only(left: 10.w, top: 5.h),
            child: Text(
              "All New",
              style: TextStyle(color: AppColors.buttonBackGround),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(top: 6.h, left: 10.w),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19.sp),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  '\&$price',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
                  child: Icon(Icons.add, color: AppColors.whiteColor),
                ),
              ),
            ],
          ),
          // SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
