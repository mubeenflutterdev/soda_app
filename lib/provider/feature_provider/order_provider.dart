// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';

import 'package:soda_bar/models/order_model.dart';

import 'package:soda_bar/utils/toast_utils.dart';

class OrderProvider with ChangeNotifier {
  List orderList = [
    {
      'img':
          "https://nazarjanssupermarket.com/cdn/shop/files/life-star-energy-drink-250ml-nazar-jan-s-supermarket.png?v=1715283098",
      'titleNotification': 'Cool berry',
      'subTitleNotification': "Rolex",
      'status': 'Pending',
    },
  ];
  Future addOrder(products, BuildContext context) async {
    try {
      OrderModel orderModel = OrderModel(
        address: 'Bagho bahar',
        orderId: 'Mashallah',
        orderStatus: 'Pending',
        paymentMethod: 'Ontable',
        placedAt: '####',
        products: [],
        totalAmount: 300000000000000,
        updatedAt: 'Never Mind',
        userId: 'Unkown',
      );
      String userUid = FirebaseAuth.instance.currentUser!.uid;
      final firestore = FirebaseFirestore.instance
          .collection('orders')
          .doc(userUid)
          .collection('ConfirmsOrders')
          .doc();
      firestore.set(orderModel.toFirestore());
      print('orderPlaced succesffully');
      final userUId = FirebaseAuth.instance.currentUser!.uid;
      final docRef = FirebaseFirestore.instance
          .collection('Cart')
          .doc(userUId)
          .collection('Product');
      final snapshot = await docRef.get();
      for (var item in snapshot.docs) {
        await item.reference.delete();
      }
      print('Cart item deleted seccessfully');
      ToastUtil.showToast(context, message: 'Done      jjj');
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    }
  }
}
