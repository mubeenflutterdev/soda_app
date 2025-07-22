import 'package:flutter/material.dart';
import 'package:soda_bar/presentation/user_view/admin_notification_screen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('Welcome to Admin Screen ')),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminNotificationScreen(),
                  ),
                );
              },
              child: Text('Notifications'),
            ),
          ),
        ],
      ),
    );
  }
}
