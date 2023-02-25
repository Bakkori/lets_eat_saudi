import 'package:flutter/material.dart';

import '../favorite.dart';

class Favorites extends ChangeNotifier {
  List<Favorite> _Favorites = [];

  List<Favorite> get favorites {
    return [..._Favorites];
  }

  addFavorite(int mealId, String mealName, String imageUrl) {
    _Favorites.add(Favorite(mealId, mealName, imageUrl));
    notifyListeners();
  }
}
