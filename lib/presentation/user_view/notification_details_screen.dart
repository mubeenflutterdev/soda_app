// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/models/notification_model.dart';

class NotificationDetailsScreen extends StatelessWidget {
  String message;
  String type;
  List<NotificationModel> notifications;
  NotificationDetailsScreen({
    super.key,
    required this.message,
    required this.notifications,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Notifications',
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20.h),

            Text(
              type.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 50.h),
            Text(message.toString(), textAlign: TextAlign.start),
          ],
        ),
      ),
    );
  }
}
