import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';

import 'package:soda_bar/const/app_images.dart';
import 'package:soda_bar/provider/feature_provider/notification_provider.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    NotificationProvider notificationProvider =
        Provider.of<NotificationProvider>(context);
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Notifications',
                  style: theme.textTheme.titleSmall!.copyWith(fontSize: 20.sp),
                ),
                Text(
                  'Clear all',
                  style: theme.textTheme.titleSmall!.copyWith(
                    fontSize: 13.sp,
                    color: AppColors.buttonBackGround,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          // 1st
          ListTile(
            title: Text(
              notificationProvider.notificationList[0]['title'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              notificationProvider.notificationList[0]['subTitle'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppImages.avatarImage),
              backgroundColor: AppColors.buttonBackGround,
            ),
          ),

          //// 2nd
          ListTile(
            title: Text(
              notificationProvider.notificationList[0]['title'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            subtitle: Text(
              notificationProvider.notificationList[0]['subTitle'],
              style: theme.textTheme.titleSmall!.copyWith(
                color: AppColors.greyColor,
                fontSize: 15,
              ),
            ),
            leading: CircleAvatar(
              backgroundImage: AssetImage(AppImages.avatarImage),
              backgroundColor: AppColors.buttonBackGround,
            ),
          ),
        ],
      ),
    );
  }
}
