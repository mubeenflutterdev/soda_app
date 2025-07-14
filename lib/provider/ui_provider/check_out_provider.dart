import 'package:flutter/material.dart';

class CheckOutProvider with ChangeNotifier {
  int? selectedTableIndex;

  /// Call this when a user taps on a table
  void selectTable(int index) {
    if (selectedTableIndex == index) {
      selectedTableIndex = null; // Unselect if same index tapped again
    } else {
      selectedTableIndex = index;
    }
    notifyListeners();
  }

  /// Check if a table is selected
  bool isSelected(int index) {
    return selectedTableIndex == index;
  }
}
