import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/const/app_images.dart';
import 'package:soda_bar/models/order_model.dart';
import 'package:soda_bar/provider/feature_provider/order_provider.dart';
import 'package:soda_bar/widgets/card/shimmer/shimmer_box.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    super.initState();
    OrderProvider orderProvider = Provider.of<OrderProvider>(
      context,
      listen: false,
    );
    orderProvider.getOrders(context);
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    final theme = Theme.of(context);
    final List<OrderModel> orders = orderProvider.ordersList;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, top: 30.h),
              child: Text('Orders', style: theme.textTheme.titleSmall),
            ),

            /// current section
            Text(
              'Current',
              style: theme.textTheme.titleSmall!.copyWith(
                fontSize: 20,
                color: AppColors.buttonBackGround,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderProvider.isLoading == true ? 5 : orders.length,
              itemBuilder: (context, index) {
                return orderProvider.isLoading == true
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ShimmerBox(height: 50, width: 90),
                      )
                    : ListTile(
                        leading: Image.asset(AppImages.smallChelly),
                        title: Text(orders[index].address.toString()),
                        trailing: Text(
                          orders[index].orderStatus.toString(),
                          style: TextStyle(color: AppColors.buttonBackGround),
                        ),
                        subtitle: Text(
                          'Placed at:${orders[index].placedAt!.toString()}',
                        ),
                      );
              },
            ),

            // 1st

            ///divider
            Divider(color: AppColors.buttonBackGround),

            /// history
            Text(
              'History',
              style: theme.textTheme.titleSmall!.copyWith(
                fontSize: 20,
                color: AppColors.buttonBackGround,
              ),
            ),
            // 1st

            //// 2nd

            //3rd
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: orderProvider.isLoading == true ? 5 : orders.length,
              itemBuilder: (context, index) {
                return orderProvider.isLoading == true
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ShimmerBox(height: 50, width: 90),
                      )
                    : ListTile(
                        leading: Image.asset(AppImages.smallChelly),

                        title: Text(orders[index].address.toString()),
                        trailing: Text(
                          orders[index].orderStatus.toString(),
                          style: TextStyle(color: AppColors.buttonBackGround),
                        ),
                        subtitle: Text(
                          'Placed at:${orders[index].placedAt!.toString()}',
                        ),
                        // leading: Icon(Icons.soap_rounded),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
