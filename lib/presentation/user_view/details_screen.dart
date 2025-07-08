import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';
import 'package:soda_bar/models/product_model.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel product;
  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size? size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  height: height * 0.8,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.r),
                      topRight: Radius.circular(40.r),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: width * 0.04,
                bottom: 350.h,
                child: Image.asset(AppImages.detailsImage, height: 320.w),
              ),
              Positioned(
                bottom: height * 0.4,
                left: width * 0.03,
                child: Text('Cool Berry', style: theme.textTheme.titleMedium),
              ),
              Positioned(
                bottom: height * 0.36,
                left: width * 0.03,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '⭐ ',
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: Color(0xFFFFB447),
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: ' 5.3 ',
                        style: theme.textTheme.titleSmall!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      TextSpan(
                        text: ' (2343 Reviews) ',
                        style: theme.textTheme.titleSmall!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: height * 0.27,
                left: width * 0.03,
                child: Text(
                  'The fizz booom  is appreciated worldwide during\n the festival of holi. It’s refrershing taste ... Read more',
                  style: theme.textTheme.titleSmall!.copyWith(fontSize: 17),
                  textAlign: TextAlign.start,
                ),
              ),

              /// lastly section for price and add to cart button
              Positioned(
                left: 20,
                right: 20,
                bottom: 10.h,
                child: Container(
                  height: 101.h,
                  width: width,
                  decoration: BoxDecoration(
                    color: AppColors.blackColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: height * 0.03,
                        left: width * 0.06,
                        child: Text(
                          'Price:',
                          style: theme.textTheme.titleSmall!.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.08,
                        left: width * 0.06,
                        child: Text(
                          '100 \$:',
                          style: theme.textTheme.titleSmall!.copyWith(
                            color: AppColors.whiteColor,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        top: height * 0.04,
                        left: width * 0.5,

                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.buttonBackGround,
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 15.h,
                            ),
                            child: Text(
                              'Add To Cart',
                              style: theme.textTheme.titleSmall!.copyWith(
                                fontSize: 17,
                                color: AppColors.whiteColor,
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
    );
  }
}
