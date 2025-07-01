import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/animation/floating_animation.dart';
import 'package:soda_bar/const/app_colors.dart';
import 'package:soda_bar/provider/feature_provider/cart_provider.dart';

class CartComponent extends StatelessWidget {
  const CartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
                          cartProvider.cartList[0]['name'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          cartProvider.cartList[0]['brand'],
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          cartProvider.cartList[0]['price'],
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.delete),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cartProvider.counterIncrement();
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
                                    cartProvider.counter.toString(),
                                    style: TextStyle(
                                      color: AppColors.whiteColor,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 5),

                              GestureDetector(
                                onTap: () {
                                  cartProvider.counterDecrement();
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
