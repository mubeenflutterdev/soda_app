import 'package:flutter/material.dart';
import 'package:soda_bar/const/app_colors.dart';

class HomeProvider with ChangeNotifier {
  void packCategries(bool isTap) {
    Color backgroundColor = isTap == true
        ? AppColors.buttonBackGround
        : AppColors.primaryColor;
    Color textColor = isTap == true
        ? AppColors.primaryColor
        : AppColors.secondaryColor;

    notifyListeners();
  }
}
