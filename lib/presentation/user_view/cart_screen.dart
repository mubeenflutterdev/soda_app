import 'package:flutter/material.dart';
import 'package:soda_bar/widgets/card/cart_component.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return CartComponent();
            },
          ),
        ),
      ),
    );
  }
}
