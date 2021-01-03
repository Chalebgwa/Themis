import 'package:flutter/material.dart';
import 'package:simon/models/article.dart';
import 'package:simon/views/components/background_page.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key key, this.article}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      opacity: .6,
      topPadding: 1,
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset("assets/1.png"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(article.title,style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30
                    ),),
                  ),
                ),

                Text(article.description),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
