import 'package:flutter/material.dart';
import 'package:soda_bar/widgets/shimmer/shimmer_box.dart';

class CategoriesShimmer extends StatelessWidget {
  int itemCount;
  CategoriesShimmer({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return ShimmerBox(height: 90, width: 50);
      },
    );
  }
}
