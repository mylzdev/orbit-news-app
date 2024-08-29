import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/formatter/formatter.dart';
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
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => THelperFunctions.launchLink(articles[index].url!),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 90,
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: articles[index].urlToImage ?? '',
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.broken_image_rounded),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            articles[index].title ?? 'No Title',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 18),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Icon(Iconsax.calendar, size: 18),
                              const SizedBox(width: 4),
                              Text(
                                TFormatter.formatDate(
                                    articles[index].publishedAt),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}