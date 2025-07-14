import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class ShopProvider with ChangeNotifier {
  int? tableNumber;
  Future getTable(BuildContext context) async {
    try {
      FirebaseFirestore.instance.collection('shop').doc().snapshots();
      var snapshot = await FirebaseFirestore.instance
          .collection('shop')
          .limit(1)
          .get();
      var data = snapshot.docs.first.data();
      var table = data['table'];
      tableNumber = table;
      notifyListeners();
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }
}
