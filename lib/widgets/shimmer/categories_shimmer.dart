// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:soda_bar/widgets/shimmer/shimmer_box.dart';

class CategoriesShimmer extends StatelessWidget {
  int itemCount;
  CategoriesShimmer({super.key, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ShimmerBox(height: 40, width: 90),
        ShimmerBox(height: 40, width: 90),
        ShimmerBox(height: 40, width: 90),
      ],
    );
  }
}
