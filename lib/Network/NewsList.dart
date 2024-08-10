import 'package:flutter/foundation.dart';

import '../data/NewsItem.dart';

class NewsList with ChangeNotifier {
  List<NewsItem> _news = [];

  late int selectedId;
  late NewsItem selectedItem;

  List<NewsItem> get newsList => _news;

  int get length => _news.length;

  NewsItem getItem(int id) {
    return _news.where((n) => n.Id == id).first;
  }

  void setNewItem(NewsItem item, int index) {
    _news[index] = item;
    notifyListeners();
  }

  List<NewsItem> get popularNews => _news.getRange(0, 7).toList();

  void setNews(List<NewsItem> news) {
    _news = news;
    notifyListeners();
  }

  void setSelectedId(int id) {
    selectedId = id;
    selectedItem = _news.where((item) => item.Id == selectedId).first;
    // notifyListeners();
  }

  void toggleIsFavorite() {
    if (selectedId != 0) {
      final index = _news.indexWhere((item) => item.Id == selectedId);

      if (index != -1) {
        _news[index] =
            _news[index].copyWith(isFavorite: !(_news[index].isFavorite));
      }
      selectedItem =
          selectedItem.copyWith(isFavorite: !selectedItem.isFavorite);
      notifyListeners();
    }
  }

  List<NewsItem> getFavoriteNews() {
    return _news.where((n) => n.isFavorite).toList();
  }
}
