import 'package:flutter/material.dart';

class ControladorUIModel with ChangeNotifier {
  int _indexBounceTabBar = 0;
  int _indexMenu = 0;
  int get indexBounceTabBar => _indexBounceTabBar;
  int get indexMenu => _indexMenu;

  setIndexBouceTabBar(int index) {
    _indexBounceTabBar = index;
    notifyListeners();
  }

  setIndexMenu(int index) {
    _indexMenu = index;
    notifyListeners();
  }
}
