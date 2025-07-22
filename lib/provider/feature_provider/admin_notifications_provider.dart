import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:soda_bar/models/admin_notification_model.dart';
import 'package:soda_bar/utils/toast_utils.dart';

class AdminNotificationsProvider with ChangeNotifier {
  List<AdminNotificationModel> notificationList = [];
  Future addNotificationForAdmin(
    BuildContext context,
    String title,
    String body,
    isSeen,
  ) async {
    try {
      final firebase = await FirebaseFirestore.instance
          .collection('adminNotifications')
          .doc();
      final notification = AdminNotificationModel(
        title: 'New product added',
        body: 'New product  is added to youre cart dear amdin',
        isSeen: false,
        docId: firebase.id.toString(),
      
      );
      firebase.set(notification.toFirebase());
      print('Notification added sucessfully');
      ToastUtil.showToast(
        context,
        message: 'Notiifcationfor admin added sucessfully',
      );
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    }
  }

  Future getNotificationForAdmin(BuildContext context) async {
    try {
      final response = await FirebaseFirestore.instance
          .collection('adminNotifications')
          .get();
      notificationList.clear();
      for (var item in response.docs) {
        final data = item.data() as Map<String, dynamic>;
        final notifications = AdminNotificationModel.fromfirebase(data);
        notificationList.add(notifications);
      }
      notifyListeners();
    } catch (e) {
      ToastUtil.showToast(context, message: e.toString());
    }
  }
}
