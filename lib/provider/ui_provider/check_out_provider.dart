import 'package:flutter/material.dart';

class CheckOutProvider with ChangeNotifier {
  bool isTapTable1 = false;
  bool isTapTable2 = false;
  bool isTapTable3 = false;
  Color? istapColor;
  Color? isnottapColor;
  void tapOnTable1() {
    isTapTable1 = !isTapTable1;
    isTapTable2 = false;
    isTapTable3 = false;
    notifyListeners();
  }

  void tapOnTable2() {
    isTapTable1 = false;
    isTapTable2 = !isTapTable2;
    isTapTable3 = false;
    notifyListeners();
  }

  void tapOnTable3() {
    isTapTable1 = false;
    isTapTable2 = false;
    isTapTable3 = !isTapTable3;
    notifyListeners();
  }
}
