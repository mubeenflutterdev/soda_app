import 'package:flutter/material.dart';
import 'package:soda_bar/const/app_colors.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [
          Container(decoration: BoxDecoration(color: AppColors.greyColor)),
          Container(decoration: BoxDecoration(color: AppColors.greyColor)),
          Container(decoration: BoxDecoration(color: AppColors.greyColor)),
          Container(decoration: BoxDecoration(color: AppColors.greyColor)),
        ],
      ),
    );
  }
}
