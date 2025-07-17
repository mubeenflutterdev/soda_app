import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/animation/floating_animation.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/provider/feature_provider/cart_provider.dart';

class CartComponent extends StatelessWidget {
  final String name;
  final String categorey;
  final double? price;
  final int index;
  final String cartId;

  CartComponent({
    super.key,
    required this.categorey,
    required this.name,
    required this.price,
    required this.index,
    required this.cartId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: SizedBox(
        height: 100.h,
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Container(
                  height: 100.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      colors: [
                        AppColors.buttonBackGround,
                        // AppColors.buttonBackGround.withValues(alpha: 0.2),
                        const Color.fromARGB(255, 43, 209, 168),
                        const Color.fromARGB(255, 94, 201, 149),
                      ],
                    ),
                  ),
                  child: Consumer<CartProvider>(
                    builder: (context, provider, child) {
                      final product = provider.productModel[index];
                      final totalPrice =
                          (product.price ?? 1) * (product.quantity ?? 1);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Padding(
                            padding: EdgeInsets.only(left: 30.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  product.category.toString(),
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Text(
                                  totalPrice.toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    provider.deleteCart(context, cartId);
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        provider.increment(index);
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      product.quantity.toString(),
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    GestureDetector(
                                      onTap: () {
                                        provider.decrement(index);
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(right: 270, bottom: 30),
              child: SizedBox(
                child: FloatingAnimation(
                  child: Image.asset(
                    height: 300,
                    width: 200,
                    'assets/images/small_bottle.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
