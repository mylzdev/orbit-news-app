import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
              _buildBreakingNewsImage(),
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
    borderRadius: BorderRadius.circular(24),
    child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
        imageUrl:
            'https://resize.indiatvnews.com/en/centered/newbucket/1200_675/2021/05/google-news-showcase-1621338438.jpg'),
  );
}

Row _buildBreakingNewsAuthor(BuildContext context) {
  return Row(
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
  );
}
