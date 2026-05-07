class ArticleModel {
  final String title;
  final String? author;
  final String description;
  final String urlToImage;
  final DateTime publishedAt;
  final String? content;
  final String articleUrl;

  const ArticleModel({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
    required this.articleUrl,
    this.author,
    this.content,
  });
}
