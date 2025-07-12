// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soda_bar/models/product_model.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class CartProvider with ChangeNotifier {
  bool isLoading = false;
  List<ProductModel> cartData = [];
  List<String> cartIds = [];
  late List<ProductModel> productInfo;
  Future addCart(BuildContext context, ProductModel productInfo) async {
    try {
      isLoading = true;
      notifyListeners();
      final userId = FirebaseAuth.instance.currentUser!.uid;

      final firestore = FirebaseFirestore.instance
          .collection('Cart')
          .doc(userId)
          .collection('Product')
          .doc();

      await firestore.set(productInfo.toFirestore());
      ToastUtil.showToast(
        context,
        message: 'Product Added sucessfully',
        type: ToastType.success,
      );
    } catch (_e) {
      ToastUtil.showToast(context, message: _e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future getCart(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final userId = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Cart')
          .doc(userId)
          .collection('Product')
          .get();
      cartData.clear();
      cartIds.clear();
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final cart = ProductModel.fromFirestore(data);
        cartData.add(cart);
        cartIds.add(doc.id);
      }
     
    } catch (_e) {
      ToastUtil.showToast(context, message: _e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future deleteCart(BuildContext context, docID) async {
    try {
      isLoading = true;
      notifyListeners();

      final userId = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('Cart')
          .doc(userId)
          .collection('Product')
          .doc(docID)
          .delete();
      ToastUtil.showToast(context, message: "Daleted sucessfully");
      final index = cartIds.indexOf(docID);
    if (index != -1) {
      cartData.removeAt(index);
      cartIds.removeAt(index);
    }

    } catch (_e) {
      ToastUtil.showToast(context, message: _e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void increment(index) {
    cartData[index].quantity = (cartData[index].quantity ?? 1) + 1;
    notifyListeners();
  }

  void decrement(int index) {
    if (cartData[index].quantity != null && cartData[index].quantity! > 1) {
      cartData[index].quantity = (cartData[index].quantity ??2)- 1;
      notifyListeners();
    }
  }
}
