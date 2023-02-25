import 'package:flutter/cupertino.dart';
import 'package:lets_eat_saudi/models/review.dart';

class Reviews with ChangeNotifier {
  List<Review> _reviews = [
    Review('من أفضل الأكلات الي جربتها', 1011, 5),
    Review('روعة مع القشطة', 1011, 4.5),
    Review('أكلة لا توصف', 1012, 4),
  ];
  List<Review> get reviews {
    return [..._reviews];
  }

  List<Review> getReviews(int mealId) {
    return _reviews.where((rev) => mealId == rev.mealId).toList();
  }

  addReviw(String review, int mealId, double rating) {
    _reviews.add(Review(review, mealId, rating));
    notifyListeners();
  }
}
