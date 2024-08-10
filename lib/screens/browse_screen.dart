import 'package:flutter/material.dart';
import 'package:news_app/components/appbar_icon.dart';
import 'package:news_app/components/categories_listview.dart';
import 'package:news_app/components/news_listview.dart';
import 'package:provider/provider.dart';

import '../Network/NewsList.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});
  // String selectedCategory = "All";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBarIcon(
                  icon: Icons.arrow_back_ios_new,
                  onClickHandler: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  'Discover',
                  style: TextStyle(fontSize: 38.0, fontWeight: FontWeight.w700),
                ),
                const Text(
                  "News from all around the world",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Search",
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      prefixIcon: const Icon(Icons.search),
                      prefixIconColor: Colors.grey,
                      suffixIcon: Icon(Icons.tune_outlined),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 12)),
                ),
                const SizedBox(
                  height: 18,
                ),
                const SizedBox(
                  height: 30,
                  child: CategoriesListView(),
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          NewsListView(
              news: Provider.of<NewsList>(context, listen: false).newsList)
        ],
      ),
    );
  }
}
