import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../data/Category.dart';
import '../data/NewsItem.dart';

class NetworkCall {
  Future<List<NewsItem>> fetchNews() async {
    List<NewsItem> news = [];
    try {
      http.Response response = await http
          .get(Uri.parse("${WEBSITE_LINK}?q=Amazon&apiKey=${API_KEY}"));

      // http.Response response = await http.get(Uri.parse(
      //     "https://newsapi.org/v2/top-headlines?country=us&apiKey=${API_KEY}"));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        List<dynamic> articles = jsonData['articles'];
        for (int i = 0; i < articles.length; i++) {
          if (articles[i]['author'] != null) {
            NewsItem? item = NewsItem.fromJson(articles.elementAt(i));
            if (item != null &&
                item.image.isNotEmpty &&
                item.authorImage.isNotEmpty) {
              // bool valid = await isImageUrlValid(item.image);
              // valid = valid && await isImageUrlValid(item.authorImage);
              if (true) {
                news.add(item);
              }
            }
          }
        }
      }
    } catch (Exception) {
      news = [
        NewsItem(
            title: 'title 1',
            description:
                'Some description bla may be e his why should key gym see, black is red blue. Colorying the hole was very help, may be his luck duck. ',
            author: "John mark",
            category: Category.Business,
            publishedDate: DateTime(2023, 9, 3),
            image: imgList.elementAt(0),
            authorImage: imgList.elementAt(1)),
        NewsItem(
            title: 'Black widow is movie star big',
            description:
                'Some description bla may be e his why should key gym see, black is red blue. Colorying the hole was very help, may be his luck duck. ',
            author: "Smith donal",
            category: Category.Business,
            publishedDate: DateTime(2024, 1, 3),
            image: imgList.elementAt(1),
            authorImage: imgList.elementAt(2)),
        NewsItem(
            title: 'Starting big change window star big',
            description:
                'Some description bla may be e his why should key gym see, black is red blue. Colorying the hole was very help, may be his luck duck. ',
            author: "Heiyly kim",
            category: Category.Business,
            publishedDate: DateTime(2024, 1, 12),
            image: imgList.elementAt(2),
            authorImage: imgList.elementAt(3)),
        NewsItem(
            title: 'Moon shows change holy star donrm',
            description:
                'Some description bla may be e his why should key gym see, black is red blue. Colorying the hole was very help, may be his luck duck. ',
            author: "Heiyly kim",
            category: Category.Entertainment,
            publishedDate: DateTime(2024, 3, 12),
            image: imgList.elementAt(3),
            authorImage: imgList.elementAt(0)),
        NewsItem(
            title: 'Kidy quora change smart star light',
            description:
                'Some description bla may be e his why should key gym see, black is red blue. Colorying the hole was very help, may be his luck duck. ',
            author: "Heiyly kim",
            category: Category.Lifestyle,
            publishedDate: DateTime(2024, 3, 12),
            image: imgList.elementAt(4),
            authorImage: imgList.elementAt(1)),
        NewsItem(
            title: 'Kidy quora change smart star light',
            description:
                'Some description bla may be e his why should key gym see, black is red blue. Colorying the hole was very help, may be his luck duck. ',
            author: "Heiyly kim",
            category: Category.Health,
            publishedDate: DateTime(2024, 3, 12),
            image: imgList.elementAt(4),
            authorImage: imgList.elementAt(1)),
        NewsItem(
            title: 'Kidy quora change smart star light home pierce',
            description:
                'Some description bla may be e his why should key gym see, black is red blue. Colorying the hole was very help, may be his luck duck. ',
            author: "Heiyly kim",
            category: Category.Business,
            publishedDate: DateTime(2024, 3, 12),
            image: imgList.elementAt(4),
            authorImage: imgList.elementAt(1)),
        NewsItem(
            title: 'Giving highly change smart star karma duch',
            description:
                'Some description bla may be e his why should key gym see, black is red blue. Colorying the hole was very help, may be his luck duck. ',
            author: "Heiyly kim",
            category: Category.Movies,
            publishedDate: DateTime(2024, 4, 12),
            image: imgList.elementAt(5),
            authorImage: imgList.elementAt(1)),
      ];
    }
    return news;
  }
}

Future<bool> isImageUrlValid(String url) async {
  final response = await http.head(Uri.parse(url));
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
