import 'package:flutter/material.dart';
import 'package:news_app/components/CategoryTag.dart';
import 'package:news_app/components/appbar_icon.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../Network/NewsList.dart';

class NewsDetailsAppBar extends StatelessWidget {
  const NewsDetailsAppBar({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<NewsList>(
      builder: (BuildContext context, value, Widget? child) {
        var item = value.selectedItem;
        // print(value.selectedItem.isFavorite);
        return SliverAppBar(
          pinned: true,
          collapsedHeight: size.height * .07,
          expandedHeight: size.height * .4,
          leading: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: AppBarIcon(
              icon: Icons.arrow_back_rounded,
              iconColor: Colors.white,
              onClickHandler: () {
                Navigator.pop(context);
              },
              iconBgColor: const Color(0xA5252525),
            ),
          ),
          actions: [
            AppBarIcon(
              icon: value.selectedItem.isFavorite
                  ? Icons.bookmark
                  : Icons.bookmark_border_rounded,
              iconColor: Colors.white,
              iconBgColor: Color(0xA5252525),
              onClickHandler: () {
                // NewsAp
                Provider.of<NewsList>(context, listen: false)
                    .toggleIsFavorite();
                // item = value.getItem(id);
              },
            ),
            SizedBox(
              width: 8.0,
            ),
            AppBarIcon(
              icon: Icons.more_horiz_outlined,
              iconColor: Colors.white,
              iconBgColor: Color(0xA5252525),
            ),
            SizedBox(
              width: 16.0,
            )
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(children: [
              Positioned.fill(
                child: Image.network(
                  item.image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, .7],
                      colors: <Color>[
                        Color(0xCC000000),
                        Colors.transparent,
                      ], // Gradient from https://learnui.design/tools/gradient-generator.html
                      tileMode: TileMode.clamp,
                    ),
                  ),
                ),
              ),
              Positioned(
                  width: size.width * .8,
                  bottom: 50.0,
                  left: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CategoryTag(category: item.category.name),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        item.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Text(
                            item.author.split(',')[0].split(' ')[0] +
                                ' ' +
                                item.author.split(',')[0].split(' ')[1],
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Container(
                            width: 5.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            timeago.format(item.publishedDate, locale: 'en'),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ]),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: SizedBox(
              width: size.width,
              height: 30.0,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90.0),
                    topRight: Radius.circular(90.0),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
