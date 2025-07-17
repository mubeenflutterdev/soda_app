// ignore_for_file: sized_box_for_whitespace, unused_local_variable, must_be_immutable, prefer_typing_uninitialized_variables, sort_child_properties_last, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';
import 'package:soda_bar/provider/feature_provider/order_provider.dart';
import 'package:soda_bar/provider/feature_provider/shop_provider.dart';
import 'package:soda_bar/provider/ui_provider/check_out_provider.dart';
import 'package:soda_bar/provider/ui_provider/image_picker_provider.dart';
import 'package:soda_bar/provider/ui_provider/payment_provider.dart';

class CheckOutScreen extends StatefulWidget {
  int totalItems;
  var totalPRice;
  CheckOutScreen({
    super.key,
    required this.totalItems,
    required this.totalPRice,
  });

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  void initState() {
    super.initState();
    ShopProvider shopProvider = Provider.of<ShopProvider>(
      context,
      listen: false,
    );
    shopProvider.getTable(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ImagePickerProvider imagePickerProvider = Provider.of<ImagePickerProvider>(
      context,
    );
    ShopProvider shopProvider = Provider.of<ShopProvider>(context);
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 10.w),
        child: SingleChildScrollView(
          child: Consumer<PaymentProvider>(
            builder: (context, paymentProvider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  Text(
                    'Checkout:',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  /// table selection here
                  Consumer<CheckOutProvider>(
                    builder: (context, cKProvider, child) {
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: shopProvider.tableNumber,
                          // itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                cKProvider.selectTable(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: cKProvider.isSelected(index) == true
                                        ? Color.fromARGB(255, 235, 232, 232)
                                        : Colors.white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          (index + 1).toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Image.asset(
                                          AppImages.chairs,
                                          height: 60,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),

                  /// order summary here
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 232, 232),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Order summary',
                            style: TextStyle(fontSize: 25.sp),
                          ),
                          SizedBox(height: 10.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Items'),
                              Text(widget.totalItems.toString()),
                            ],
                          ),
                          SizedBox(height: 6.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('SubTotal'),
                              Text(
                                widget.totalPRice.toString(),
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
                                '\$ 0',
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
                                '${widget.totalPRice} \$',
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
                    onTap: () {
                      paymentProvider.ontable();
                    },
                    selected: paymentProvider.is1stture,
                    selectedTileColor: AppColors.buttonBackGround,
                    selectedColor: AppColors.whiteColor,
                    enabled: true,
                    leading: CircleAvatar(child: Image.asset(AppImages.chairs)),
                    title: Text(
                      'On  Table',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('03410148101'),
                  ),
                  SizedBox(height: 8.h),
                  ListTile(
                    onTap: () {
                      paymentProvider.easypaisa();
                    },
                    selected: paymentProvider.is2stture,
                    selectedTileColor: AppColors.buttonBackGround,
                    selectedColor: AppColors.whiteColor,
                    leading: CircleAvatar(
                      child: Image.asset(AppImages.easypaisa),
                    ),
                    title: Text(
                      'Easypaisa',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('03400000212'),
                  ),
                  SizedBox(height: 8.h),

                  ListTile(
                    onTap: () {
                      paymentProvider.jazzcash();
                    },
                    selected: paymentProvider.is3stture,
                    selectedTileColor: AppColors.buttonBackGround,
                    selectedColor: AppColors.whiteColor,

                    leading: CircleAvatar(
                      child: Image.asset(AppImages.jazzcash),
                    ),
                    title: Text(
                      'JazzCash',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('03410148101'),
                  ),

                  SizedBox(height: 10.h),

                  Consumer<OrderProvider>(
                    builder: (context, Provider, child) {
                      return GestureDetector(
                        onTap: () {
                          Provider.addOrder('products', context);
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          child: Provider.isLoading == true
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.whiteColor,
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    'Confirm Order',
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                          decoration: BoxDecoration(
                            color: AppColors.buttonBackGround,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      );
                    },
                  ),

                  SizedBox(height: 20.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
