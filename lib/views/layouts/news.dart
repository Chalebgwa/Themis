import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simon/controllers/artile_provider.dart';
import 'package:simon/views/components/background_page.dart';
import 'package:simon/views/components/news_card.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _articles = Provider.of<ArticleProvider>(context).articles;
    return BackgroundPage(
      sidePadding: 5,
      //topPadding: 80,
      child: Container(
        child: ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (context, i) {
            return NewsCard(
              article: _articles[i],
            );
          },
        ),
      ),
    );
  }
}
