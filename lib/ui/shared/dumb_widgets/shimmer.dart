import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final Widget? child;
  final double? customBorderRadius;

  const ShimmerWidget({
    Key? key,
    this.child,
    this.customBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        child: child!,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(customBorderRadius ?? 4.0.r),
          color: Colors.grey[400]!,
        ),
      ),
    );
  }
}
