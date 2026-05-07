class ArticleModel {
  final String? title;
  final String? author;
  final String? description;
  final String? urlToImage;
  final DateTime? publshedAt;
  final String? content;
  final String? articleUrl;

  const ArticleModel({
    this.title,
    this.description,
    this.author,
    this.content,
    this.publshedAt,
    this.urlToImage,
    this.articleUrl, required DateTime publishedAt,
  });
}