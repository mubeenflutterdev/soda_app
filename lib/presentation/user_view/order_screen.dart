import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/provider/feature_provider/order_provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 30.h),
            child: Text('Orders', style: theme.textTheme.titleSmall),
          ),

          /// current section
          Text(
            'Current',
            style: theme.textTheme.titleSmall!.copyWith(
              fontSize: 20,
              color: AppColors.buttonBackGround,
            ),
          ),
          // 1st
          ListTile(
            title: Text(
              orderProvider.orderList[0]['titleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              orderProvider.orderList[0]['subTitleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            leading: Image.network(orderProvider.orderList[0]['img']),
            trailing: Text(
              orderProvider.orderList[0]['status'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.buttonBackGround,
                fontSize: 15,
              ),
            ),
          ),
          //// 2nd
          ListTile(
            title: Text(
              orderProvider.orderList[0]['titleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              orderProvider.orderList[0]['subTitleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            leading: Image.network(orderProvider.orderList[0]['img']),
            trailing: Text(
              orderProvider.orderList[0]['status'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.buttonBackGround,
                fontSize: 15,
              ),
            ),
          ),

          //3rd
          ListTile(
            title: Text(
              orderProvider.orderList[0]['titleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              orderProvider.orderList[0]['subTitleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            leading: Image.network(orderProvider.orderList[0]['img']),
            trailing: Text(
              orderProvider.orderList[0]['status'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.buttonBackGround,
                fontSize: 15,
              ),
            ),
          ),

          ///divider
          Divider(color: AppColors.buttonBackGround),

          /// history
          Text(
            'History',
            style: theme.textTheme.titleSmall!.copyWith(
              fontSize: 20,
              color: AppColors.buttonBackGround,
            ),
          ),
          // 1st
          ListTile(
            title: Text(
              orderProvider.orderList[0]['titleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              orderProvider.orderList[0]['subTitleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            leading: Image.network(orderProvider.orderList[0]['img']),
            trailing: Text(
              orderProvider.orderList[0]['status'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.buttonBackGround,
                fontSize: 15,
              ),
            ),
          ),
          //// 2nd
          ListTile(
            title: Text(
              orderProvider.orderList[0]['titleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              orderProvider.orderList[0]['subTitleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            leading: Image.network(orderProvider.orderList[0]['img']),
            trailing: Text(
              orderProvider.orderList[0]['status'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.buttonBackGround,
                fontSize: 15,
              ),
            ),
          ),

          //3rd
          ListTile(
            title: Text(
              orderProvider.orderList[0]['titleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              orderProvider.orderList[0]['subTitleNotification'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            leading: Image.network(orderProvider.orderList[0]['img']),
            trailing: Text(
              orderProvider.orderList[0]['status'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.buttonBackGround,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
 
 
 
  }
}
