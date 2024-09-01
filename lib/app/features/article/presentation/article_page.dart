import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/features/article/data/api/api.dart';
import 'package:news_app/app/features/article/presentation/bloc/article_event.dart';
import 'package:news_app/app/features/article/presentation/cubit/article_tab_cubit.dart';

import '../../../core/di/injection_container.dart';
import '../../../core/utils/constant/sizes.dart';
import 'bloc/article_bloc.dart';
import 'bloc/article_state.dart';
import 'widgets/article_widget.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    final articleCategoryLength = ArticleCategory.values.length;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final articleBloc = sl<ArticleBloc>();
            articleBloc.add(const GetData(ArticleCategory.general));
            return articleBloc;
          },
        ),
        BlocProvider(create: (context) => ArticleTabCubit())
      ],
      child: DefaultTabController(
        length: articleCategoryLength,
        child: Scaffold(
          appBar: const ArticleAppbar(),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) =>
                [const ArticleSliverAppbar()],
            body: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: BlocBuilder<ArticleBloc, ArticleState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const ArticleLoadingView(),
                    loading: () => const ArticleLoadingView(),
                    success: (articles) => TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          articleCategoryLength,
                          (index) {
                            return ArticleSuccessView(articles: articles);
                          },
                        )),
                    error: (failure) =>
                        ArticleErrorView(message: failure.message),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
