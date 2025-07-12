// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soda_bar/provider/feature_provider/cart_provider.dart';
import 'package:soda_bar/provider/feature_provider/product_provider.dart';
import 'package:soda_bar/widgets/card/cart_component.dart';
import 'package:soda_bar/widgets/shimmer/product_shimmer.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    
    super.initState();
    CartProvider cartProvider = Provider.of<CartProvider>(
      context,
      listen: false,
    );
    cartProvider.getCart(context);
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: Center(
        child: Consumer<CartProvider>(
          builder: (context, provider, child) {
            return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ProductProvider>(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: cartProvider.cartData.length,
                  itemBuilder: (context, index) {
                    return value.isLoading == true
                        ? ProductShimmer()
                        : CartComponent(
                          categorey: provider.cartData.isEmpty
                              ? 'No Data'
                              : provider.cartData[index].category
                                    .toString(),
                          name: provider.cartData.isEmpty
                              ? 'No Data'
                              : provider.cartData[index].name
                                    .toString(),
                          price: provider.cartData.isEmpty
                              ? 555
                              : provider.cartData[index].price,
                          index: index,
                          cartId: provider.cartIds[index],
                        );
                  },
                );
              },
            ),
          );
        
        
          },
          
        ),
      ),
    );
  }
}
