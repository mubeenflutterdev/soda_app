import 'package:flutter/material.dart';

class NotificationDetailsScreen extends StatefulWidget {
  const NotificationDetailsScreen({super.key});

  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Notification', style: TextStyle(fontSize: 30)),
          Text('Your order is getting ready'),
          Text(
            'The fizz booom  is appreciated worldwide during the festival of holi. It’s refrershing tasteThe fizz booom  is appreciated worldwide during the festival of holi. It’s refrershing tasteThe fizz booom  is appreciated worldwide during the festival of holi. It’s refrershing tasteThe fizz booom  is appreciated worldwide during the festival of holi. It’s refrershing tasteThe fizz booom  is appreciated worldwide during the festival of holi. It’s refrershing tasteThe fizz booom  is appreciated worldwide during the festival of holi. It’s refrershing taste',
          ),
        ],
      ),
    );
  }
}
