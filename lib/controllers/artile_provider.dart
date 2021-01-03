import 'package:flutter/material.dart';
import 'package:simon/models/article.dart';
import 'package:simon/models/data.dart';

class ArticleProvider extends ChangeNotifier {
  List<Article> _articles = testArticles;
  List<Article> get articles => _articles;

  void addArticle(
      String author, String title, String description, DateTime date) {
    var article = Article(title, description, author, date);
    _articles.add(article);
    notifyListeners();
  }
}
