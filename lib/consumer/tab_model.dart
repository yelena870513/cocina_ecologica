import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  int _currentIndex = 0;
  get currentIndex => _currentIndex;
  
  void setCurrentIndex(int index) {
    if(index > -1) {
      _currentIndex = index;
      notifyListeners();
    }
  }
}