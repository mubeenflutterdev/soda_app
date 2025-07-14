// ignore_for_file: use_build_context_synchronously, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:soda_bar/models/product_model.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class CartProvider with ChangeNotifier {
  bool isLoading = false;
  List<ProductModel> productModel = [];
  List<String> cartIds = [];
  double? total_price;
  bool isAvailbleInCart = false;

  Future addCart(BuildContext context, ProductModel productModel) async {
    try {
      isLoading = true;
      notifyListeners();
      final userId = FirebaseAuth.instance.currentUser!.uid;
      if (productModel.quantity == null || productModel.quantity == 0) {
        productModel.quantity = 1;
        // Default quantity on first add
      }

      checkAvailableCart(productModel.id.toString());
      print(isAvailbleInCart);
      if (isAvailbleInCart == true) {
        final firestore = FirebaseFirestore.instance
            .collection('Cart')
            .doc(userId)
            .collection('Product')
            .doc(productModel.cartId)
            .update({
              'quantity': FieldValue.increment(1),
              'price': int.parse(productModel.price.toString()) * 2,
            });
      } else {
        final firestore = FirebaseFirestore.instance
            .collection('Cart')
            .doc(userId)
            .collection('Product')
            .doc();

        await firestore.set(productModel.toFirestore());
      }

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

  Future checkAvailableCart(String productId) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Cart')
          .doc(userId)
          .collection('Product')
          .where('id', isEqualTo: productId)
          .get();

      isAvailbleInCart = snapshot.docs.isNotEmpty;
      notifyListeners();

      return isAvailbleInCart;
    } catch (e) {
      print('Error checking cart availability: ${e.toString()}');
      isAvailbleInCart = false;
      notifyListeners();
      return false;
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
      productModel.clear();
      cartIds.clear();
      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        final cart = ProductModel.fromFirestore(data);
        productModel.add(cart);
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
        productModel.removeAt(index);
        cartIds.removeAt(index);
      }
    } catch (_e) {
      ToastUtil.showToast(context, message: _e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future updateQuantityInFirestore(int index) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docId = cartIds[index];

    await FirebaseFirestore.instance
        .collection('Cart')
        .doc(userId)
        .collection('Product')
        .doc(docId)
        .update({'quantity': productModel[index].quantity});
  }

  void increment(index) async {
    productModel[index].quantity = (productModel[index].quantity ?? 1) + 1;
    notifyListeners();
    await updateQuantityInFirestore(index);
  }

  void decrement(int index) async {
    if (productModel[index].quantity != null &&
        productModel[index].quantity! > 1) {
      productModel[index].quantity = (productModel[index].quantity ?? 2) - 1;
      notifyListeners();
      await updateQuantityInFirestore(index);
    }
  }

  totalPrice() {
    double total = 0.0;

    for (var item in productModel) {
      total += (item.price ?? 0) * (item.quantity ?? 1);
    }
    total_price = total;
    return total;
  }
}
