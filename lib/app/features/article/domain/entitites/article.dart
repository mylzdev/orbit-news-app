import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Article extends Equatable {
  final String? title;
  final String? content;
  final DateTime? publishedAt;
  final String? url;
  final String? urlToImage;
  const Article({
    this.title,
    this.content,
    this.publishedAt,
    this.url,
    this.urlToImage,
  });

  @override
  List<Object> get props => [title!, content!, publishedAt!, url!, urlToImage!];
}
