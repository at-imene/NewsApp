import 'package:flutter/material.dart';
import 'package:news_app/components/appbar_icon.dart';
import 'package:news_app/components/news_listview.dart';
import 'package:provider/provider.dart';

import '../Network/NewsList.dart';
import '../components/ImageSlider.dart';
import '../constants/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppBarIcon(
                  icon: Icons.menu,
                ),
                Row(
                  children: [
                    AppBarIcon(icon: Icons.search),
                    SizedBox(width: 20.0),
                    AppBarIcon(icon: Icons.notifications_rounded),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Breaking News',
                  style: kSubTitleTextStyle,
                ),
                Text(
                  'View all',
                  style: kLinkTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(height: 260.0, child: ImageSlider()),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommendations',
                  style: kSubTitleTextStyle,
                ),
                Text(
                  'View all',
                  style: kLinkTextStyle,
                ),
              ],
            ),
          ),
          NewsListView(
              news: Provider.of<NewsList>(context, listen: false).newsList)
          // ),
        ],
      ),
    );
  }
}
