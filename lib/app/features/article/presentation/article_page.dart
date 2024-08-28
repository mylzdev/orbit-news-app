import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:news_app/app/features/article/presentation/bloc/article_event.dart';

import '../../../../injection_container.dart';
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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              backgroundColor: Colors.blue[100],
              child: const FlutterLogo(),
            ),
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
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.search_normal),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Breaking News',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            imageUrl:
                                'https://resize.indiatvnews.com/en/centered/newbucket/1200_675/2021/05/google-news-showcase-1621338438.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Contact lost With Bogokshh Airline Boeing 852-4512 After take off',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(child: FlutterLogo()),
                                    const SizedBox(width: 12),
                                    Text(
                                      'John Miles',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .apply(color: Colors.black54),
                                    ),
                                  ],
                                ),
                                Text(
                                  '28, Aug 2024',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(color: Colors.black54),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                BlocBuilder<ArticleBloc, ArticleState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const CircularProgressIndicator(),
                      loading: () => const CircularProgressIndicator(),
                      success: (articles) =>
                          ArticleSuccessView(articles: articles),
                      error: (failure) =>
                          ArticleErrorView(message: failure.message),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
