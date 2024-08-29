import 'package:flutter/material.dart';

import '../../../../core/common/widgets/shimmer/shimmer.dart';

class ArticleLoadingView extends StatelessWidget {
  const ArticleLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          height: 90,
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: const AspectRatio(
                    aspectRatio: 1 / 1,
                    child: TShimmerEffect(
                      width: double.maxFinite,
                      height: double.maxFinite,
                    )),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TShimmerEffect(width: double.maxFinite, height: 10),
                      const SizedBox(height: 4),
                      TShimmerEffect(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 10,
                      ),
                      const Spacer(),
                      TShimmerEffect(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}