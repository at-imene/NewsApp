import 'package:flutter/cupertino.dart';
import 'package:news_app/data/NewsItem.dart';

class SelectedNewsItem with ChangeNotifier {
  late NewsItem _item;

  set setItem(NewsItem item) {
    _item = item;
  }

  get item => _item;
}
