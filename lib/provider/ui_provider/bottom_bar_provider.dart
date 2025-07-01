import 'package:flutter/material.dart';

class BottomBarProvider with ChangeNotifier {
  int currentIindex = 0;
  setindex(index) {
    currentIindex = index;
    notifyListeners();
  }
}
