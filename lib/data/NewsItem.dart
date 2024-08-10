import 'dart:math';

import 'Category.dart';

class NewsItem {
  final int Id;
  final String title;
  final String description;
  final String author;
  final Category category;
  final DateTime publishedDate;
  final String image;
  final String authorImage;
  final bool isFavorite;
  static int _nextId = 0;

  // List<Category> categories = Category
  NewsItem({
    required this.title,
    required this.description,
    required this.author,
    required this.category,
    required this.publishedDate,
    required this.image,
    required this.authorImage,
    this.isFavorite = false,
  }) : Id = _nextId++;

  @override
  String toString() {
    return 'NewsItem{title: $title, description: $description, author: $author, category: $category, publishedDate: $publishedDate, image: $image, authorImage: $authorImage}';
  }

  NewsItem copyWith({
    String? title,
    String? description,
    String? author,
    Category? category,
    DateTime? publishedDate,
    String? image,
    String? authorImage,
    bool? isFavorite,
  }) {
    return NewsItem(
      title: title ?? this.title,
      description: description ?? this.description,
      author: author ?? this.author,
      category: category ?? this.category,
      publishedDate: publishedDate ?? this.publishedDate,
      image: image ?? this.image,
      authorImage: authorImage ?? this.authorImage,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  // static int i = 0;
  static NewsItem? fromJson(Map<String, dynamic> data) {
    var title = data['title'];
    var author = data['author'];
    var description = data['description'];
    var date = DateTime.parse(data['publishedAt']);

    if (title != null &&
        author != null &&
        description != null &&
        date != null &&
        data['urlToImage'] != null) {
      return NewsItem(
          title: title,
          author: author,
          description: description,
          category: Category.values
              .elementAt(Random().nextInt(Category.values.length)),
          publishedDate: date,
          image: data['urlToImage'],
          authorImage: imgList.elementAt(Random().nextInt(imgList.length)));
    }
    return null;
  }
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
