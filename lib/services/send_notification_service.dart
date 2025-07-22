// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:soda_bar/services/get_server_key_service.dart';

class SendNotificationService {
  static Future<void> sendNotificationUsingApi({
    required String? token,
    required String? title,
    required String? body,
    required Map<String, dynamic>? data,
  }) async {
    String serverKey = await GetServerKeySevice().getServerKeyToken();
    String url =
        'https://fcm.googleapis.com/v1/projects/pickuplines-82369/messages:send';
    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    };
    // message
    Map<String, dynamic> message = {
      "message": {
        "token": token,
        "notification": {"body": body, "title": title},
        "data": data,
      },
    };

    // hit api
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('notification sent successfully');
    } else {
      print('Notification not sent');
    }
  }

  static Future<void> sendNotificationUsingApiToAllUsers({
    required String? title,
    required String? body,
    required Map<String, dynamic>? data,
  }) async {
    String serverKey = await GetServerKeySevice().getServerKeyToken();
    String url =
        'https://fcm.googleapis.com/v1/projects/fir-notification-1a116/messages:send';
    var headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $serverKey',
    };
    // message
    Map<String, dynamic> message = {
      "message": {
        "topic": 'all',
        "notification": {"body": body, "title": title},
        "data": data,
      },
    };

    // hit api
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(message),
    );

    if (response.statusCode == 200) {
      print('notification sent successfully');
    } else {
      print('Notification not sent');
    }
  }
}
