import 'package:flutter/material.dart';

import '../favorite.dart';

class Favorites extends ChangeNotifier {
  List<Favorite> _Favorites = [
    Favorite(1011, 'المعصوب',
        'https://menu360.me/wp-content/uploads/2021/08/0Y2A0110.jpg'),
    Favorite(1012, 'السليق الطائفي',
        'https://menu360.me/wp-content/uploads/2021/08/0Y2A0110.jpg'),
    Favorite(1013, ' ثريد   ',
        'https://modo3.com/thumbs/fit630x300/147754/1481539129/%D9%85%D8%A7_%D9%87%D9%8A_%D8%A3%D9%83%D9%84%D8%A9_%D8%A7%D9%84%D8%AB%D8%B1%D9%8A%D8%AF.jpg'),
  ];

  List<Favorite> get favorites {
    // check the ...
    return [..._Favorites];
  }

  List<Favorite> getFavorite(int mealId) {
    return _Favorites.where((fev) => mealId == fev.mealId).toList();
  }

// use saved perfences
  addFavorite(int mealId, String mealName, String imageUrl) {
    _Favorites.add(Favorite(mealId, mealName, imageUrl));
    notifyListeners();
  }
}