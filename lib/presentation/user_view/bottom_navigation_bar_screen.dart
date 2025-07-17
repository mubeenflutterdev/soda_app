// ignore_for_file: deprecated_member_use

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';

import 'package:soda_bar/presentation/user_view/cart_screen.dart';

import 'package:soda_bar/presentation/user_view/home_screen.dart';
import 'package:soda_bar/presentation/user_view/notification_screen.dart';
import 'package:soda_bar/presentation/user_view/order_screen.dart';

import 'package:soda_bar/presentation/user_view/profile_screen.dart';
import 'package:soda_bar/provider/feature_provider/dashboard_provider.dart';
import 'package:soda_bar/provider/feature_provider/product_provider.dart';
import 'package:soda_bar/provider/feature_provider/user_info_provider.dart';
import 'package:soda_bar/provider/ui_provider/bottom_bar_provider.dart';

class Bottomnavigationbarscreen extends StatefulWidget {
  const Bottomnavigationbarscreen({super.key});

  @override
  State<Bottomnavigationbarscreen> createState() =>
      _BottomnavigationbarscreenState();
}

class _BottomnavigationbarscreenState extends State<Bottomnavigationbarscreen> {
  @override
  void initState() {
    super.initState();
    final userInfoProvider = Provider.of<UserInfoProvider>(
      context,
      listen: false,
    );
    userInfoProvider.getUserInfo(context);
    final productProvider = Provider.of<ProductProvider>(
      context,
      listen: false,
    );
    productProvider.getProducts(context);
    final dashboardProvider = Provider.of<DashboardProvider>(
      context,
      listen: false,
    );
    dashboardProvider.getDashboad(context);
  }

  @override
  Widget build(BuildContext context) {
    final userInfoProvider = Provider.of<UserInfoProvider>(context);

    final provider = Provider.of<BottomBarProvider>(context);
    List screens = [
      HomeScreen(),

      CartScreen(),
      OrderScreen(),
      NotificationScreen(),

      ProfileScreen(),
    ];

    return Scaffold(
      body: screens[provider.currentIindex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: AppColors.buttonBackGround,
        animationCurve: Curves.decelerate,
        color: AppColors.buttonBackGround.withValues(alpha: .4),
        backgroundColor: Colors.transparent,

        // height: 70,
        index: provider.currentIindex,
        onTap: (value) {
          provider.setindex(value);
        },
        items: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(FontAwesomeIcons.home, color: AppColors.whiteColor),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              FontAwesomeIcons.shoppingCart,
              color: AppColors.whiteColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(FontAwesomeIcons.solidBookmark, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(FontAwesomeIcons.bell, color: Colors.white, size: 30),
          ),

          userInfoProvider.userInfo == null
              ? CircularProgressIndicator()
              : CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    userInfoProvider.userInfo!.profileImage,
                  ),
                ),
        ],
      ),
    );
  }
}
