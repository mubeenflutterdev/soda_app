// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/animation/floating_animation.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/provider/feature_provider/cart_counter_provider.dart';

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
    CartCounterProvider cartCounterProvider = Provider.of<CartCounterProvider>(
      context,
    );
    var price =
        cartProvider.cartData[index].price! * cartCounterProvider.counter;
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
                          cartProvider.cartData[index].name.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          cartProvider.cartData[index].category.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          // (cartProvider.cartData[index].price.toString())*(cartCounterProvider.counter),
                          price.toString(),

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
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //// i am deleteing cart
                              cartProvider.deleteCart(context, cartId);
                            },

                            child: Icon(Icons.delete, color: Colors.red),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cartCounterProvider.counterIncrement();
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
                                    cartCounterProvider.counter.toString(),
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 5),

                              GestureDetector(
                                onTap: () {
                                  cartCounterProvider.counterDecrement();
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    cartProvider.decrement(index);
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: AppColors.whiteColor,
                                  ),
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
