// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/const/app_colors.dart';

class ButtonComponent extends StatefulWidget {
  String text;
  double borderRadius;
  double? height = 20.h;
  double? weidht = double.infinity;
  VoidCallback ontap;
  ButtonComponent({
    super.key,
    required this.text,
    required this.borderRadius,
    required this.ontap,
    this.height,
    this.weidht,
  });

  @override
  State<ButtonComponent> createState() => _ButtonComponentState();
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Container(
        height: widget.height,
        width: widget.weidht,
        decoration: BoxDecoration(
          color: AppColors.buttonBackGround,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(color: AppColors.primaryColor, fontSize: 19.sp),
            ),
          ),
        ),
      ),
    );
  }
}
