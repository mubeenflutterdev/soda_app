import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  List notificationList = [
    {'title': 'this is title', 'subTitle': 'this is description'},
    {'subTitle': 'this is title', 'description': 'this is description'},
    {'title': 'this is title', 'description': 'this is description'},
  ];
}
