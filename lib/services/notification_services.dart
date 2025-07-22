// ignore_for_file: prefer_final_fields

import 'dart:io';

import 'package:app_settings/app_settings.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:soda_bar/presentation/user_view/notification_screen.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // 1 for notification permission request
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
      Future.delayed(const Duration(seconds: 2), () {
        AppSettings.openAppSettings(type: AppSettingsType.notification);
      });
    }
  }

  // 2 get the device token
  Future<String?> getDeviceToken() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );
    String? token = await messaging.getToken();

    return token;
  }

  // 3 for local notification init
  void initLocalNotification(
    BuildContext context,
    RemoteMessage message,
  ) async {
    var androidInItSettings = const AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );

    var iosInItSettings = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: androidInItSettings,
      iOS: iosInItSettings,
    );

    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payLoad) {
        handleMessage(context, message);
      },
    );
  }

  //4 handle firebase states
  //firebase init
  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification!.android;
      if (kDebugMode) {
        print('notification title ${notification!.title}');
        print('notification body ${notification.body}');
      }
      if (Platform.isIOS) {
        isoForgroundMessage();
      }
      if (Platform.isAndroid) {
        initLocalNotification(context, message);
        // handleMessage(context, message);
        showNotification(message);
      }
    });
  }

  //8 funtion to show notifications
  Future<void> showNotification(RemoteMessage message) async {
    //chanell setting
    AndroidNotificationChannel channel = AndroidNotificationChannel(
      message.notification!.android!.channelId.toString(),
      message.notification!.android!.channelId.toString(),
      importance: Importance.high,
      showBadge: true,
      playSound: true,
    );
    //android setting

    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          channel.id.toString(),
          channel.name.toString(),
          channelDescription: 'Chanell description',
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
          sound: channel.sound,
        );

    //ios setting

    DarwinNotificationDetails darwinNotificationDetails =
        const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );

    //merge
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    // show notification
    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title.toString(),
        message.notification!.body.toString(),
        notificationDetails,
        payload: 'my_data',
      );
    });
  }

  //6 background and terminated state
  Future<void> setupIntractMessage(BuildContext context) async {
    // background state
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      handleMessage(context, message);
    });
    // terminated state
    FirebaseMessaging.instance.getInitialMessage().then((
      RemoteMessage? message,
    ) {
      if (message != null && message.data.isNotEmpty) {
        handleMessage(context, message);
      }
    });
  }

  //7 message handler
  Future<void> handleMessage(
    BuildContext context,
    RemoteMessage message,
  ) async {
    if (message.data['screen'].toString() == 'message') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NotificationScreen()),
      );
    }
    //else if (message.data['screen'].toString() == 'notification') {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => NotificationScreen(message: message),
    //     ),
    // );
    // } else {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => HomeScreen()),
    //   );
    // }
  }

  //5 for ios message
  Future isoForgroundMessage() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
}
