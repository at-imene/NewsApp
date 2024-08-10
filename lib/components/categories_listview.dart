import 'package:flutter/material.dart';
import 'package:news_app/components/CategoryTag.dart';

import '../data/Category.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: Category.values.length + 1, // Add 1 for "All" category
      itemBuilder: (context, index) {
        if (index == 0) {
          return CategoryTag(
              category: "All",
              isActive: selectedCategory == "All"); // Handle "All" category
        }
        final category = Category.values[index - 1]; // Adjust index for "All"
        return CategoryTag(
          category: category.name,
          isActive: selectedCategory == category.name,
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(width: 6.0), // Adjust width as needed
    );
  }
}
