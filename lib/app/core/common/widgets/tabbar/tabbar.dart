import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant/colors.dart';

class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  const TTabbar({
    super.key,
    required this.tabs,
    this.controller,
    this.onTap,
  });

  final List<Tab> tabs;
  final TabController? controller;
  final Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: TColors.scaffoldColor,
      child: TabBar(
        onTap: onTap,
        controller: controller,
        padding: EdgeInsets.zero,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: Get.isDarkMode ? Colors.white : TColors.primary,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
