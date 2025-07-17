// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/widgets.dart';

import 'package:soda_bar/models/order_model.dart';

import 'package:soda_bar/utils/toast_utils.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> ordersList = [];
  bool isLoading = false;
  List dummyOrderList = [
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
        address: '',
        orderId: 'Mashallah',
        orderStatus: 'Pending',
        paymentMethod: 'Ontable',
        placedAt: DateTime.now().toString(),
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

      final userUId = FirebaseAuth.instance.currentUser!.uid;
      final docRef = FirebaseFirestore.instance
          .collection('Cart')
          .doc(userUId)
          .collection('Product');
      final snapshot = await docRef.get();
      for (var item in snapshot.docs) {
        await item.reference.delete();
      }
      getOrders(context);
      notifyListeners();

      ToastUtil.showToast(
        context,
        message: 'Order Placed Sucessfully',
        type: ToastType.success,
      );
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    }
  }

  Future getOrders(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      final userUid = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('orders')
          .doc(userUid)
          .collection('ConfirmsOrders')
          .get();
      ordersList.clear();
      for (var items in snapshot.docs) {
        final data = items.data() as Map<String, dynamic>;
        final orderData = OrderModel.fromFirestore(data);
        ordersList.add(orderData);
        print('*************************${ordersList.first.address}');
      }
      // print(ordersList);
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
