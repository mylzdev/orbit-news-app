import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constant/colors.dart';

class TShimmerEffect extends StatelessWidget {
  const TShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final isDark = Get.isDarkMode;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (isDark ? TColors.darkerGrey : TColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
