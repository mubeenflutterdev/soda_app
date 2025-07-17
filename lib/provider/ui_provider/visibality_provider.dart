import 'package:flutter/material.dart';

class VisibalityProvider with ChangeNotifier {
  bool isHide = false;
  void visibileTextFormField() {
    isHide = !isHide;
    notifyListeners();
  }
}
