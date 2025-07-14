// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/animation/floating_animation.dart';
import 'package:soda_bar/const/app_colors.dart';

import 'package:soda_bar/provider/feature_provider/cart_provider.dart';

class CartComponent extends StatelessWidget {
  String name;
  String categorey;
  double? price;
  int index;
  String cartId;

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
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    double totalPrice =
        (cartProvider.productModel[index].price ?? 0) *
        (cartProvider.productModel[index].quantity ?? 1);

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartProvider.productModel[index].name.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          cartProvider.productModel[index].category.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          totalPrice.toStringAsFixed(2),

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: [
                          GestureDetector(
                            onTap: () {
                              cartProvider.deleteCart(context, cartId);
                            },

                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cartProvider.increment(index);
                                },
                                child: Icon(
                                  Icons.add,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              SizedBox(width: 5),
                              Consumer(
                                builder: (context, counterProvider, child) {
                                  return Text(
                                    cartProvider.productModel[index].quantity
                                        .toString(),

                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 5),

                              GestureDetector(
                                onTap: () {
                                  cartProvider.decrement(index);
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
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsGeometry.only(right: 280.w),
            child: FloatingAnimation(
              child: Image.network(
                // height: 300,
                'https://nazarjanssupermarket.com/cdn/shop/files/life-star-energy-drink-250ml-nazar-jan-s-supermarket_large.png?v=1715283098',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
