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
        body: Column(
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
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: ListView.builder(
                    // scrollDirection: Axis.horizontal,
                    // padding: EdgeInsets.symmetric(horizontal: 10),
                    itemCount: 10,

                    itemBuilder: (context, index) {
                      return ProductDasboard(
                        img: AppImages.smallSoda,
                        name: "Soda",
                        price: 340,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
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
    var mediaquery = MediaQuery.of(context).size;
    double height = mediaquery.height;
    double width = mediaquery.width;
    return Padding(
      padding: EdgeInsets.only(
        left: width * 0.05,
        right: width * 0.05,
        top: height * 0.04,
        bottom: height * 0.001,
      ),
      child: Container(
        width: double.infinity,
        height: height * 0.28,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.05),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              //////////////////////////////////////////////////////////////////////////////
              padding: EdgeInsets.only(left: width * 0.08),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      // flex: 2,
                      child: Stack(
                        children: [
                          Positioned(
                            top: height * 0.02,

                            child: Image.asset(AppImages.dashboardtext),
                          ),

                          /// 1st heading here
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.05),
                            child: Stack(
                              children: [
                                Positioned(
                                  // top: height * 0.065,
                                  child: Text(
                                    '30% off',
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// 2nd heading here
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.1),
                            child: Stack(
                              children: [
                                Positioned(
                                  // top: 1,
                                  child: Text(
                                    'The Eid     \nOffer',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,

                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          /// buy now button here
                          Positioned(
                            top: height * 0.22,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04,
                                  vertical: height * 0.01,
                                ),
                                child: GestureDetector(
                                  onTap: () {},

                                  child: Text('Buy Now'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(width: 20),
            Padding(
              padding: EdgeInsets.only(right: width * 0.06),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ////// soda bottle image here
                  Image.asset(AppImages.sodaBottleImage, height: 200),
                ],
              ),
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
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Container(
        // width: 10.w,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            colors: [
              const Color.fromARGB(255, 36, 219, 195),
              const Color.fromARGB(255, 42, 228, 203),
              // const Color.fromARGB(255, 57, 122, 114),
              const Color.fromARGB(86, 201, 193, 193),

              // Colors.black,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(img, height: 150)),
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 5.h),
              child: Text(
                "All New",
                style: TextStyle(color: AppColors.blackColor),
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
                      bottomRight: Radius.circular(15.r),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.h,
                      horizontal: 6.w,
                    ),
                    child: Icon(Icons.add, color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
            // SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
