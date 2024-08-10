import 'package:flutter/material.dart';
import 'package:news_app/components/news_listview.dart';
import 'package:provider/provider.dart';

import '../Network/NewsList.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: const Text(
              'Favorite',
              style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.w700),
            ),
          ),
          NewsListView(
              news: Provider.of<NewsList>(context, listen: true)
                  .getFavoriteNews())
        ],
      ),
    );
  }
}
