import 'package:flutter/material.dart';

class PaymentProvider with ChangeNotifier {
  bool is1stture = true;
  bool is2stture = false;
  bool is3stture = false;

  void easypaisa() {
    is2stture = !is2stture;
    is3stture = false;
    is1stture = false;
    notifyListeners();
  }

  void jazzcash() {
    is2stture = false;
    is3stture = !is3stture;
    is1stture = false;
    notifyListeners();
  }

  void ontable() {
    is2stture = false;
    is3stture = false;
    is1stture = !is1stture;
    notifyListeners();
  }
}
