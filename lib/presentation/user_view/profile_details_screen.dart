// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/provider/feature_provider/notification_provider.dart';
import 'package:soda_bar/provider/feature_provider/profile_provider.dart';

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
    final notificationsProvider = Provider.of<NotificationProvider>(context);
    var data = userInfoProvider.userInfo;
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    TextEditingController name = TextEditingController(
      text: userInfoProvider.userInfo!.name,
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 90.h),
              userInfoProvider.userInfo == null
                  ? CircularProgressIndicator()
                  : Stack(
                      children: [
                        CircleAvatar(
                          radius: 70.r,
                          backgroundImage: NetworkImage(
                            userInfoProvider.userInfo!.profileImage,
                          ),
                        ),
                        Positioned(
                          left: 90,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () {
                              profileProvider.uploadUserProfileImage(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.whiteColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.blackColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
              SizedBox(height: 50.h),

              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Edit name'),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: TextFormField(controller: name),
                          ),
                          TextButton(
                            onPressed: () async {
                              String finalname = name.text.trim();
                              await userInfoProvider.updateName(
                                finalname,
                                context,
                              );
                              Navigator.pop(context);
                            },
                            child: Text('Update'),
                          ),
                        ],
                      );
                    },
                  );
                  // ScaffoldMessenger.of(context).showMaterialBanner(

                  //   MaterialBanner(

                  //     content: Column(children: [Text('data'), Text('data')]),
                  //     actions: [Icon(Icons.back_hand), Icon(Icons.done)],
                  //   ),
                  // );
                },
                child: ListTile(
                  title: Text('Name'),
                  subtitle: Text(data!.name.toString()),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.edit),
                ),
              ),
              SizedBox(height: 20.h),

              ListTile(
                onTap: () {},

                title: Text('Email'),
                subtitle: Text(data.email.toString()),
                leading: Icon(Icons.email),
                // trailing: Icon(Icons.edit),
              ),
              SizedBox(height: 20.h),

              ListTile(
                onTap: () {
                  notificationsProvider.getNotification(context);
                },

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
      ),
    );
  }
}
