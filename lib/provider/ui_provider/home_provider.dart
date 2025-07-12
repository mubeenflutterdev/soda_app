// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:soda_bar/const/app_colors.dart';

class HomeProvider with ChangeNotifier {
  bool isTap = false;
  void packCategries(isTap) {
    Color backgroundColor = isTap == true
        ? AppColors.buttonBackGround
        : AppColors.whiteColor;
    notifyListeners();

    Color textColor = isTap == true
        ? AppColors.whiteColor
        : AppColors.blackColor;

    notifyListeners();
  }
}
