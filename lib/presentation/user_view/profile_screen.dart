import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_icons.dart';
import 'package:soda_bar/const/app_images.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // save button here
            Padding(
              padding: EdgeInsets.only(top: 20.h, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            CircleAvatar(
              backgroundImage: AssetImage(AppImages.avatarImage),
              radius: 60,
            ),
            SizedBox(height: 10.h),

            Text(
              'Mark Adam',
              style: theme.textTheme.titleSmall!.copyWith(fontSize: 24.sp),
            ),
            Text(
              'Sunny_Koelpin45@hotmail.com',
              style: theme.textTheme.titleSmall!.copyWith(
                fontSize: 10.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),

            ListTile(
              title: Text('Profile'),
              leading: Icon(AppIcons.profile),
              trailing: Icon(Icons.arrow_forward),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Contacts'),
              leading: Icon(Icons.email_outlined),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: Text('Share app'),
              leading: Icon(Icons.share),
              trailing: Icon(Icons.arrow_forward),
            ),
            SizedBox(height: 20),
            ListTile(
              title: Text('Help'),
              leading: Icon(
                CupertinoIcons.question_circle,
                color: AppColors.blackColor,
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            SizedBox(height: 20),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        CupertinoIcons.question_circle,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      'LogOut',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 19,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
