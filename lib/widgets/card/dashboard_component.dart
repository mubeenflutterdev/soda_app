import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/provider/feature_provider/dashboard_provider.dart';

class DashBoardComponent extends StatelessWidget {
  const DashBoardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardProvider dashboardProvider = Provider.of<DashboardProvider>(
      context,
    );

    var mediaquery = MediaQuery.of(context).size;
    double height = mediaquery.height;
    double width = mediaquery.width;
    final img = dashboardProvider.dataList?.img ?? '';
    final discount = dashboardProvider.dataList?.discount ?? '';
    final name = dashboardProvider.dataList?.name ?? '';

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
          gradient: const LinearGradient(
            colors: [
              Colors.black,
              Colors.black,
              Color.fromARGB(255, 45, 53, 52),
              Color.fromARGB(255, 36, 219, 195),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Left side (text content)
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(
                  left: width * 0.08,
                  top: height * 0.02,
                  bottom: height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.01),
                    Text(
                      '$discount% off',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        // Handle tap
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.01,
                        ),
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),

            /// Right side (image)
            Flexible(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(right: width * 0.03),
                child: Image.network(
                  img,
                  height: height * 0.22,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
