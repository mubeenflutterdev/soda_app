// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/presentation/user_view/notification_details_screen.dart';

import 'package:soda_bar/provider/feature_provider/notification_provider.dart';
import 'package:soda_bar/widgets/card/shimmer/shimmer_box.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    NotificationProvider notificationProvider =
        Provider.of<NotificationProvider>(context, listen: false);
    notificationProvider.getNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    NotificationProvider notificationProvider =
        Provider.of<NotificationProvider>(context);
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // notificationProvider.getNotification(context);
                  },
                  child: Text('Clear all  '),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notificationProvider.notifications.length,
                itemBuilder: (context, index) {
                  return notificationProvider.isLoading == true
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: ShimmerBox(height: 50, width: 60),
                        )
                      : Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: ListTile(
                            onTap: () {
                              notificationProvider.updateIsSeen(
                                notificationProvider.notifications[index].id
                                    .toString(),
                                context,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NotificationDetailsScreen(
                                        message: notificationProvider
                                            .notifications[index]
                                            .message
                                            .toString(),
                                        notifications:
                                            notificationProvider.notifications,
                                        type: notificationProvider
                                            .notifications[index]
                                            .type
                                            .toString(),
                                      ),
                                ),
                              );
                            },
                            leading: Icon(
                              size: 50.r,
                              Icons.circle_notifications_rounded,
                              color:
                                  notificationProvider
                                          .notifications[index]
                                          .isSeen ==
                                      true
                                  ? AppColors.buttonBackGround
                                  : Colors.grey,
                            ),
                            title: ReadMoreText(
                              isExpandable: false,
                              notificationProvider.notifications[index].message
                                  .toString(),
                              trimMode: TrimMode.Line,
                              trimLines: 1,
                              colorClickableText: AppColors.buttonBackGround,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            // trailing: Text(
                            //   notificationProvider.notifications[index].isSeen
                            //       .toString(),
                            // ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
