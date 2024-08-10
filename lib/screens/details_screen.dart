import 'package:flutter/material.dart';
import 'package:news_app/Network/NewsList.dart';
import 'package:news_app/components/news_details_app_bar.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var item = Provider.of<NewsList>(context, listen: false).getItem(id);
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: CustomScrollView(
            slivers: [
              NewsDetailsAppBar(
                id: id,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 16.0, top: 0.0, right: 24.0, bottom: 35.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30.0)),
                              child: Image.network(
                                item.authorImage,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            item.author,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
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
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        item.description * 12,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          wordSpacing: 1.3,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 0,
            child: SizedBox(
              height: 70,
              width: size.width,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      Colors.black.withOpacity(.5),
                      Colors.transparent
                    ])),
              ),
            ))
      ]),
    );
  }
}
