import 'package:flutter/material.dart';

class FavoritesViewModel with ChangeNotifier {
  List<String> _favorites = [];
  get favorites => _favorites;

  setFavorites(newValues){
    _favorites = newValues;
    notifyListeners();
  }
}
