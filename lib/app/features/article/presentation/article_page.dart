import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/features/article/presentation/bloc/article_event.dart';

import '../../../../injection_container.dart';
import '../../../core/common/widgets/tabbar/tabbar.dart';
import '../../../core/utils/constant/sizes.dart';
import 'bloc/article_bloc.dart';
import 'bloc/article_state.dart';
import 'widgets/article_widget.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final articleBloc = sl<ArticleBloc>();
        articleBloc.add(const GetData());
        return articleBloc;
      },
      child: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: const ArticleAppbar(),
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const SliverAppBar(
                  pinned: true,
                  floating: true,
                  expandedHeight: 455,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: EdgeInsets.all(TSizes.md),
                      child: ArticleBreakingNews(),
                    ),
                  ),
                  bottom: TTabbar(
                    tabs: [
                      Tab(child: Text('All')),
                      Tab(child: Text('International')),
                      Tab(child: Text('Media')),
                      Tab(child: Text('Magazine')),
                      Tab(child: Text('Business')),
                      Tab(child: Text('Crypto')),
                      Tab(child: Text('Economics')),
                    ],
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(TSizes.md),
              child: BlocBuilder<ArticleBloc, ArticleState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const ArticleLoadingView(),
                    loading: () => const ArticleLoadingView(),
                    success: (articles) =>
                        ArticleSuccessView(articles: articles),
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
