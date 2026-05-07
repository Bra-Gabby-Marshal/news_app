import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class NewsService {
  final List<ArticleModel> news = [];

  final String apiKey = 'd648ba60293e4ce999ed34d7b80797d1';

  Future<void> getNews() async {
    final url = Uri.parse(
      'https://newsapi.org/v2/everything?q=tesla&from=2026-04-07&sortBy=publishedAt&apiKey=$apiKey',
    );

    await _fetchNews(url);
  }

  Future<void> getNewsForCategory(String category) async {
    final url = Uri.parse(
      'https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey',
    );

    await _fetchNews(url);
  }

  Future<void> _fetchNews(Uri url) async {
    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        debugPrint('Request failed: ${response.statusCode}');
        return;
      }

      final jsonData = jsonDecode(response.body);

      if (jsonData['status'] == 'ok') {
        for (final element in jsonData['articles']) {
          if (element['urlToImage'] != null &&
              element['description'] != null) {
            final article = ArticleModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publishedAt: DateTime.parse(element['publishedAt']),
              content: element['content'],
              articleUrl: element['url'],
            );

            news.add(article);
          }
        }
      }
    } catch (e) {
      debugPrint('Error fetching news: $e');
    }
  }
}