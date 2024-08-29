import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constant/colors.dart';

class TTabbar extends StatelessWidget implements PreferredSizeWidget {
  const TTabbar({
    super.key,
    required this.tabs,
  });

  final List<Tab> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
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
