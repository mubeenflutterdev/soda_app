import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:soda_bar/models/notification_model.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel> notifications = [];

  List<Map<String, dynamic>> notificationList = [];
  bool isLoading = false;
  Future<void> updateIsSeen(String docId, BuildContext context) async {
    try {
      await FirebaseFirestore.instance
          .collection('notifications')
          .doc(docId)
          .update({'isSeen': true});
      getNotification(context);
    } catch (e) {
      ToastUtil.showToast(
        context,
        message: e.toString(),
        type: ToastType.error,
      );
    }
  }

  Future<void> getNotification(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('notifications')
          .get();

      notifications.clear();
      notificationList.clear();

      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;

        // Convert to model
        final notification = NotificationModel.fromFirestore(data, doc.id);
        notifications.add(notification); // ✅ add to model list

        // Also add raw map if you still want to use notificationList
        // notificationList.add({
        //   'id': doc.id,
        //   'message': data['message'],
        //   'type': data['type'],
        // });
      }

      print(notificationList); // ✅ Should now print actual data
      notifyListeners();
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
