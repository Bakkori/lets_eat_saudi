import 'package:lets_eat_saudi/models/review.dart';

class Reviews {
  List<Review> reviews = [
    Review('من أفضل الأكلات الي جربتها', 1011),
  ];

  getReviews() {
    return reviews;
  }

// use saved perfences
  addReviw(String review, int mealId) {
    reviews.add(Review(review, mealId));
  }
}
