import 'package:flutter/material.dart';

class BookmarkProvider extends ChangeNotifier {
  List bookmarkList = [];

  addBookmark({required String url}) {
    bookmarkList.add(url);
    notifyListeners();
  }

  removeBookmark({required String url}) {
    if (bookmarkList.contains(url)) {
      bookmarkList.remove(url);
      notifyListeners();
    }
  }
}
