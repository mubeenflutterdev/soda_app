import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soda_bar/widgets/card/shimmer/shimmer_box.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.6,
          mainAxisSpacing: 20.w,
          crossAxisSpacing: 20.w,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return ShimmerBox(height: 0, width: 0);
        },
      ),
    );
  }
}
