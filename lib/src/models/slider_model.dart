import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier {
  double _currentPage = 0;

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  double get currentPage => _currentPage;
}

