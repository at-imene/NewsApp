import 'package:flutter/material.dart';
import 'package:news_app/screens/details_screen.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../Network/NewsList.dart';
import 'CategoryTag.dart';

class ImageSliderItem extends StatelessWidget {
  const ImageSliderItem({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    var newsItem = Provider.of<NewsList>(context, listen: false).getItem(id);
    return GestureDetector(
      onTap: () {
        Provider.of<NewsList>(context, listen: false).setSelectedId(id);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return DetailsScreen(
            id: id,
          );
        }));
      },
      child: Container(
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  newsItem.image,
                  fit: BoxFit.fill,
                  height: 250,
                ),
                Container(
                  color: Colors.black.withOpacity(.25),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryTag(
                        category: newsItem.category.name,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                newsItem.author,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SizedBox(
                                height: 18.0,
                                width: 18,
                                child: Image.asset(
                                  'images/bluesymbole.png',
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                width: 5.0,
                                height: 5.0,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                timeago.format(newsItem.publishedDate,
                                    locale: 'en'),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            newsItem.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
