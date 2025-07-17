// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/const/app_colors.dart';

class ProductDasboard extends StatelessWidget {
  String img;
  String name;
  var price;
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
        // height: 400,
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
            Padding(
              padding: const EdgeInsets.only(left: 37),
              child: Image.network(img, height: 147.5),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                "All New",
                style: TextStyle(color: AppColors.blackColor),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
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
