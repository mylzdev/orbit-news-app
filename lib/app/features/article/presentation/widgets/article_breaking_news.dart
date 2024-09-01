import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app/core/utils/constant/sizes.dart';

class ArticleBreakingNews extends StatelessWidget {
  const ArticleBreakingNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Headline',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBreakingNewsImage(),
              Padding(
                padding: const EdgeInsets.all(TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olympic rings will continue to adorn Eiffel Tower even after games: Paris Mayor',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: TSizes.sm),
                    _buildBreakingNewsAuthor(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

ClipRRect _buildBreakingNewsImage() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(TSizes.borderRadiusLg),
    child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl:
            'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202409/as-the-city-of-lights-gears-up-for-the-largest-sporting-event-in-the-world--we-bring-you-a-host-of-a-260927341-16x9.jpg?VersionId=fV5E4basr7Lgbs.U2QZkqVGC2DoBPiFI&size=690:388'),
  );
}

Row _buildBreakingNewsAuthor(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Source: BBC News',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .apply(color: Colors.black54),
      ),
      Text(
        '28, Aug 2024',
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .apply(color: Colors.black54),
      )
    ],
  );
}
