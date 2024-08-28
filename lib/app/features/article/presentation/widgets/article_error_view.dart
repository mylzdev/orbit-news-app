import 'package:flutter/material.dart';

class ArticleErrorView extends StatelessWidget {
  const ArticleErrorView({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Text(message ?? 'Something went wrong');
  }
}
