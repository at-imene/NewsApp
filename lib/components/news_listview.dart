import 'package:flutter/material.dart';
import 'package:news_app/components/list_item.dart';
import 'package:provider/provider.dart';

import '../Network/NewsList.dart';
import '../data/NewsItem.dart';
import '../screens/details_screen.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.news});

  final List<NewsItem> news;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10.0),
        physics: NeverScrollableScrollPhysics(),
        itemCount: news.length,
        itemBuilder: (context, index) {
          try {
            var item = news[index];
            return ListItem(
              title: item.title,
              categoryName: item.category.name,
              author: item.author,
              authorImage: item.authorImage,
              imageUrl: item.image,
              publishDate: item.publishedDate,
              onTapHandler: () {
                Provider.of<NewsList>(context, listen: false)
                    .setSelectedId(item.Id);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailsScreen(id: item.Id);
                }));
              },
            );
          } catch (e) {
            return Container(
              height: 100.0,
              color: Colors.amber,
            );
          }
        });
  }
}
