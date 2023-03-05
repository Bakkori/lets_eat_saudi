import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../favorite.dart';

class Favorites extends ChangeNotifier {
  List<Favorite> _favorites = [];

  List<Favorite> get favorites {
    return [..._favorites];
  }

  addFavorite(int mealId, String mealName, String imageUrl) {
    if (_favorites.isNotEmpty) {
      if (!checkIfExists(mealId)) {
        _favorites.add(Favorite(mealId, mealName, imageUrl));
        Fluttertoast.showToast(msg: 'تم إضافة الطبق إلى قائمة المفضلة');
      } else {
        Fluttertoast.showToast(msg: 'تم إضافة الطبق إلى قائمة المفضلة مسبقاً');
      }
    } else {
      _favorites.add(Favorite(mealId, mealName, imageUrl));
      Fluttertoast.showToast(msg: 'تم إضافة الطبق إلى قائمة المفضلة');
    }
    notifyListeners();
  }

  removeFavorite(int id) {
    _favorites.removeWhere((meal) => meal.mealId == id);
    notifyListeners();
  }

  bool checkIfExists(int mealId) {
    for (var meal in _favorites) {
      if (meal.mealId == mealId) {
        return true;
      }
    }
    return false;
  }
}
