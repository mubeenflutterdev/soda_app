import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/provider/feature_provider/admin_notifications_provider.dart';

class AdminNotificationScreen extends StatefulWidget {
  const AdminNotificationScreen({super.key});

  @override
  State<AdminNotificationScreen> createState() =>
      _AdminNotificationScreenState();
}

class _AdminNotificationScreenState extends State<AdminNotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AdminNotificationsProvider adminNotificationsProvider =
        Provider.of<AdminNotificationsProvider>(context, listen: false);
    adminNotificationsProvider.getNotificationForAdmin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Consumer<AdminNotificationsProvider>(
            builder: (context, provider, child) {
              return Expanded(
                child: ListView.builder(
                  itemCount: provider.notificationList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {},
                      title: Text(
                        provider.notificationList[index].title.toString(),
                      ),
                      subtitle: Text(
                        provider.notificationList[index].body.toString(),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
