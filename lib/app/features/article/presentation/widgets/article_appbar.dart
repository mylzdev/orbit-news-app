import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/app/core/common/widgets/appbar/appbar.dart';

class ArticleAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ArticleAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TAppbar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leadingWidget: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: const FlutterLogo(),
        ),
        leadingWidth: 50,
        title: Text(
          '28, Aug 2024',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .apply(color: Colors.grey[700]),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.search_normal),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
