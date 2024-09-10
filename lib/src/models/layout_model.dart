

import 'package:disenos_app/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {

  Widget _currentPage = const SlidesShowPage();

  Widget get currentPage => _currentPage;

  set currentPage(Widget value) {
    _currentPage = value;
    notifyListeners();
  }
}