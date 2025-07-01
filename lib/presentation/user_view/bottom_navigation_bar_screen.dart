import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';
import 'package:soda_bar/presentation/user_view/cart_screen.dart';
import 'package:soda_bar/presentation/user_view/check_out_screen.dart';
import 'package:soda_bar/presentation/user_view/details_screen.dart';
import 'package:soda_bar/presentation/user_view/home_screen.dart';
import 'package:soda_bar/presentation/user_view/notification_details_screen.dart';
import 'package:soda_bar/presentation/user_view/notification_screen.dart';
import 'package:soda_bar/presentation/user_view/order_screen.dart';
import 'package:soda_bar/presentation/user_view/profile_screen.dart';
import 'package:soda_bar/provider/ui_provider/bottom_bar_provider.dart';

class Bottomnavigationbarscreen extends StatefulWidget {
  const Bottomnavigationbarscreen({super.key});

  @override
  State<Bottomnavigationbarscreen> createState() =>
      _BottomnavigationbarscreenState();
}

class _BottomnavigationbarscreenState extends State<Bottomnavigationbarscreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomBarProvider>(context);
    List screens = [
      HomeScreen(),
      CartScreen(),
      CheckOutScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: screens[provider.currentIindex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: AppColors.buttonBackGround,
        animationCurve: Curves.decelerate,
        color: AppColors.buttonBackGround.withValues(alpha: .3),
        backgroundColor: Colors.transparent,

        // height: 70,
        index: provider.currentIindex,
        onTap: (value) {
          provider.setindex(value);
        },
        items: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(FontAwesomeIcons.home, color: AppColors.blackColor),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(
              FontAwesomeIcons.shoppingCart,
              color: AppColors.blackColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(FontAwesomeIcons.solidBookmark, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(FontAwesomeIcons.bell, color: Colors.white, size: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(AppImages.avatarImage, width: 50, height: 50),
          ),
        ],
      ),
    );
  }
}
