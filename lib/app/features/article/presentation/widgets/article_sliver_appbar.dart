import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../core/common/widgets/tabbar/tabbar.dart';
import '../../../../core/utils/constant/sizes.dart';
import '../../data/api/api.dart';
import '../bloc/article_bloc.dart';
import '../bloc/article_event.dart';
import '../cubit/article_tab_cubit.dart';
import 'article_breaking_news.dart';

class ArticleSliverAppbar extends StatelessWidget {
  const ArticleSliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 480,
      automaticallyImplyLeading: false,
      flexibleSpace: const FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.all(TSizes.md),
          child: ArticleBreakingNews(),
        ),
      ),
      bottom: TTabbar(
        onTap: (index) {
          context.read<ArticleTabCubit>().setTabIndex(index);
          context
              .read<ArticleBloc>()
              .add(GetData(ArticleCategory.values.elementAt(index)));
        },
        tabs: ArticleCategory.values.map(
          (category) {
            return Tab(
              text: category.name.capitalizeFirst,
            );
          },
        ).toList(),
      ),
    );
  }
}
