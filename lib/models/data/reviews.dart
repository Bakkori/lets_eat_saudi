import 'package:flutter/cupertino.dart';
import 'package:lets_eat_saudi/models/review.dart';

class Reviews with ChangeNotifier {
  List<Review> _reviews = [
    Review('من أفضل الأكلات الي جربتها', 1011),
    Review('روعة مع القشطة', 1011),
    Review('أكلة لا توصف', 1012),
  ];
  List<Review> get reviews {
    // check the ...
    return [..._reviews];
  }

  List<Review> getReviews(int mealId) {
    return _reviews.where((rev) => mealId == rev.mealId).toList();
  }

// use saved perfences
  addReviw(String review, int mealId) {
    _reviews.add(Review(review, mealId));
    notifyListeners();
  }

  printRev() {
    for (var i = 0; i < _reviews.length; i++) {
      print(_reviews[i].review);
    }
  }
}
