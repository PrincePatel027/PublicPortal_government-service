import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String? url;

  getURL({required String uRL}) {
    url = uRL;
    notifyListeners();
  }
}
