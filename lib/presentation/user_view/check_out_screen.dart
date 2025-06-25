import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';
import 'package:soda_bar/widgets/buttons/button_component.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),
              Text(
                'Checkout:',
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),

              ///
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    children: [
                      Text('Order summary', style: TextStyle(fontSize: 25.sp)),
                      SizedBox(height: 10.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Items'), Text('2')],
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('SubTotal'),
                          Text(
                            '\$55',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount'),
                          Text(
                            '\$5',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 6.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery Fee'),
                          Text(
                            'Free',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      Divider(thickness: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total'),
                          Text(
                            '\$50',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                'Choose Payment Method:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              ListTile(
                leading: CircleAvatar(child: Image.asset(AppImages.chairs)),
                title: Text(
                  'On  Table',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('03410148101'),
              ),
              SizedBox(height: 8.h),
              ListTile(
                leading: CircleAvatar(child: Image.asset(AppImages.easypaisa)),
                title: Text(
                  'Easypaisa',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('03400000212'),
              ),
              SizedBox(height: 8.h),

              ListTile(
                leading: CircleAvatar(child: Image.asset(AppImages.jazzcash)),
                title: Text(
                  'JazzCash',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('03410148101'),
              ),
              SizedBox(height: 10.h),

              ButtonComponent(text: 'Confirm', borderRadius: 5.r, ontap: () {}),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
