import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_icons.dart';
import 'package:soda_bar/models/user_model.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final userInfoProvider = Provider.of<UserInfoProvider>(context);
    var data = userInfoProvider.userInfo;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 90.h),
            userInfoProvider.userInfo == null
                ? CircularProgressIndicator()
                : CircleAvatar(
                    radius: 70.r,
                    backgroundImage: NetworkImage(
                      userInfoProvider.userInfo!.profileImage,
                    ),
                  ),
            SizedBox(height: 50.h),

            ListTile(
              title: Text('Name'),
              subtitle: Text(data!.name.toString()),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.edit),
            ),
            SizedBox(height: 20.h),

            ListTile(
              onTap: () {},

              title: Text('Email'),
              subtitle: Text(data.email.toString()),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.edit),
            ),
            SizedBox(height: 20.h),

            ListTile(
              onTap: () {},

              title: Text('Created At'),
              subtitle: Text(data.createdAt.toString()),
              leading: Icon(FontAwesomeIcons.clock),
            ),
            SizedBox(height: 20.h),

            Card(
              color: AppColors.listTileBackgroundColor,
              child: ListTile(
                onTap: () {},
                title: Text(
                  'Change Profile image',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  'Click here to upload image',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(
                  FontAwesomeIcons.userLarge,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
