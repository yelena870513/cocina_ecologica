import 'package:cocina_ecologica/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoritoModel with ChangeNotifier {
  List _favoritoList = <int>[];
  List get favoritoList => _favoritoList;
  
  addItem(int idFavorito) async {
    var box = await Hive.openBox<int>(Strings.favoritos);
    box.add(idFavorito);
    print('added');
    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<int>(Strings.favoritos);
    _favoritoList = box.values.toList();
    notifyListeners();
  }  

  deleteItem(int index) {
    final box = Hive.box<int>(Strings.favoritos);
    box.deleteAt(index);
    getItem();
    notifyListeners();
  }
}
