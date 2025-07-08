import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';

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
        //// changes here
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
                            padding: EdgeInsets.only(top: height * 0.045),
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
                            padding: EdgeInsets.only(top: height * 0.085),
                            child: Stack(
                              children: [
                                Positioned(
                                  // top: 1,
                                  child: Text(
                                    'The Eid\nOffer',

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
              padding: EdgeInsets.only(right: width * 0.03),
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
