// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

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

      // Set default quantity if null or 0
      productModel.quantity ??= 1;
      if (productModel.quantity! < 1) {
        productModel.quantity = 1;
      }

      // Check if product exists in cart
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Cart')
          .doc(userId)
          .collection('Product')
          .where('id', isEqualTo: productModel.id.toString())
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Product exists in cart - update quantity
        String cartId = snapshot.docs.first.id;
        int currentQuantity = snapshot.docs.first.get('quantity') ?? 1;
        double productPrice = double.parse(productModel.price.toString());

        await FirebaseFirestore.instance
            .collection('Cart')
            .doc(userId)
            .collection('Product')
            .doc(cartId)
            .update({
              'quantity': currentQuantity + 1,
              'price': productPrice * (currentQuantity + 1),
            });
      } else {
        // Product doesn't exist in cart - add new
        final firestore = FirebaseFirestore.instance
            .collection('Cart')
            .doc(userId)
            .collection('Product')
            .doc();

        productModel.cartId = firestore.id;
        productModel.quantity = 1; // Set initial quantity to 1
        await firestore.set(productModel.toFirestore());
      }

      ToastUtil.showToast(
        context,
        message: 'Product added to cart',
        type: ToastType.success,
      );
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> checkAvailableCart(String productId) async {
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
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future deleteCart(BuildContext context, String docID) async {
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

      ToastUtil.showToast(context, message: "Removed from cart");

      final index = cartIds.indexOf(docID);
      if (index != -1) {
        productModel.removeAt(index);
        cartIds.removeAt(index);
      }
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future updateQuantityInFirestore(int index) async {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final docId = cartIds[index];
    double pricePerUnit = productModel[index].price ?? 0;
    int quantity = productModel[index].quantity ?? 1;

    await FirebaseFirestore.instance
        .collection('Cart')
        .doc(userId)
        .collection('Product')
        .doc(docId)
        .update({'quantity': quantity, 'price': pricePerUnit * quantity});
  }

  void increment(int index) async {
    productModel[index].quantity = (productModel[index].quantity ?? 1) + 1;
    await updateQuantityInFirestore(index);
    totalPrice(); // Update total price
    notifyListeners();
  }

  void decrement(int index) async {
    if (productModel[index].quantity != null &&
        productModel[index].quantity! > 1) {
      productModel[index].quantity = (productModel[index].quantity ?? 2) - 1;
      // notifyListeners();
      await updateQuantityInFirestore(index);
      totalPrice(); // Update total price
      notifyListeners();
    }
  }

  double totalPrice() {
    double total = 0.0;
    for (var item in productModel) {
      total += (item.price ?? 0) * (item.quantity ?? 1);
    }
    total_price = total;

    return total;
  }

  void clearCart() {
    productModel.clear();
    cartIds.clear();
    total_price = 0.0;
    notifyListeners();
  }
}
