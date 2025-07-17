// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:soda_bar/models/dashboard_model.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class DashboardProvider with ChangeNotifier {
  DashboardModel? dataList;
  bool isLoading = false;
  Future getDashboad(BuildContext context) async {
    try {
      isLoading = true;
      // notifyListeners();
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('dashboard')
          .doc('J5aBuDX3vGFPdtlvXCop')
          .get();

      // for (var doc in snapshot.doc) {

      // }
      dataList = DashboardModel.fromFirestore(snapshot.data());
      print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      print(dataList?.img.toString());
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
      print(
        'EEEEEEEEEEEEEEEEEEEEEEERRRRRRRRRRRRRRRRRRRRRRRRRROOOOOOOOOOOOOOOOOORRRRRRRRRRRRRRRR',
      );
      print(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
