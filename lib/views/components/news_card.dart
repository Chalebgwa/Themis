import 'package:flutter/material.dart';
import 'package:simon/models/article.dart';
import 'package:simon/views/layouts/article_view.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key key,
    this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          var route = MaterialPageRoute(
            builder: (context) => ArticleView(
              article: article,
            ),
          );
          Navigator.push(context, route);
        },
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(
            //maxHeight: size.height/2,
            minHeight: size.height / 6,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  subtitle: Text("by ${article.author}"),
                  title: Text(article.title),
                ),
              ),
              //Divider(),
              Container(
                height: size.height / 4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  child: Text(
                    article.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
