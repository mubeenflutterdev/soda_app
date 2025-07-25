// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_icons.dart';

import 'package:soda_bar/presentation/user_view/profile_details_screen.dart';

import 'package:soda_bar/provider/feature_provider/auth_provider.dart';
import 'package:soda_bar/provider/feature_provider/categories_provider.dart';
import 'package:soda_bar/provider/feature_provider/product_provider.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userProvider = Provider.of<UserInfoProvider>(
        context,
        listen: false,
      );
      userProvider.getUserInfo(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authProvider = Provider.of<AuthentactionProvider>(context);
    final userInfoProvider = Provider.of<UserInfoProvider>(context);
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // save button here
              Padding(
                padding: EdgeInsets.only(top: 50.h, right: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Color(0xff0DB295),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              userInfoProvider.userInfo == null
                  ? CircularProgressIndicator()
                  : CircleAvatar(
                      radius: 50.r,
                      backgroundImage: NetworkImage(
                        userInfoProvider.userInfo!.profileImage,
                      ),
                    ),
              SizedBox(height: 10.h),

              Text(
                userInfoProvider.userInfo != null
                    ? userInfoProvider.userInfo!.name.toString()
                    : '',
                style: theme.textTheme.titleSmall!.copyWith(fontSize: 24.sp),
              ),
              Text(
                userInfoProvider.userInfo != null
                    ? userInfoProvider.userInfo!.email.toString()
                    : '',
                style: theme.textTheme.titleSmall!.copyWith(
                  fontSize: 10.sp,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),

              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileDetailsScreen(),
                    ),
                  );
                },
                title: Text('Profile'),
                leading: Icon(AppIcons.profile),
                trailing: Icon(Icons.arrow_forward),
              ),
              SizedBox(height: 20),
              ListTile(
                onTap: () async {
                  await productProvider.getProducts(context);

                  // try {
                  //   await FirebaseFirestore.instance
                  //       .collection('products')
                  //       .doc()
                  //       .set({
                  //         "id": "soda001",
                  //         "name": "Coca Cola Classic",
                  //         "image": "https://example.com/images/coca_cola.png",
                  //         "price": 1.50,
                  //         "flavor": "Coca Cola",
                  //         "quantity": 100,
                  //         "category": "Cola",
                  //         "categoryId": "cat001",
                  //         "rating": 4.8,
                  //         "addedDate": "2025-07-01T10:30:00Z",
                  //         "updatedDate": "2025-07-03T14:00:00Z",
                  //         "size": "500ml",
                  //       });
                  // } catch (e) {
                  //   ToastUtil.showToast(context, message: e.toString());
                  // }
                },
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
              Card(
                color: AppColors.redColor,
                child: ListTile(
                  onTap: () {
                    authProvider.logOut(context);
                  },
                  title: Text('Logout'),
                  leading: Icon(
                    CupertinoIcons.question_circle,
                    color: AppColors.blackColor,
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
