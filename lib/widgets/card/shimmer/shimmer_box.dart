// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:soda_bar/const/app_colors.dart';

///// shimer box

class ShimmerBox extends StatelessWidget {
  ShimmerBox({super.key, required this.height, required this.width});

  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(milliseconds: 2000),

      child: Container(
        height: height,
        width: width,
        // padding: EdgeInsetsDirectional.all(10),

        decoration: BoxDecoration(
          color: AppColors.blackColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
