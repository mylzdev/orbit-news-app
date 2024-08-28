import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/helper/helper_functions.dart';
import '../../domain/entitites/article.dart';

class ArticleSuccessView extends StatelessWidget {
  const ArticleSuccessView({
    super.key,
    required this.articles,
  });

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () async {
            await HelperFunctions.launchLink(articles[index].url ?? '');
          },
          leading: CachedNetworkImage(
            imageUrl: articles[index].urlToImage ?? '',
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          title: Text(articles[index].publishedAt!.toIso8601String()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(articles[index].title ?? ''),
              Text(
                articles[index].content ?? '',
              ),
            ],
          ),
        );
      },
    );
  }
}
