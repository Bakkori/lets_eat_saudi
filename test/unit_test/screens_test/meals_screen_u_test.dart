import 'package:flutter_test/flutter_test.dart';
import 'package:lets_eat_saudi/models/data/meals_data.dart';
import 'package:lets_eat_saudi/models/meals.dart';
import 'package:lets_eat_saudi/screens/meals_screen.dart';

void main() {
  test('Should Add meals based on category id #Hijazi', () {
    int category_id = 101;
    int meal_id = 1011; // معصوب
    List<Meal> mealsList = MealsData().mealsData;
    List<Meal> meals = [];
    expect(addMeals(mealsList, category_id, meals).elementAt(0).id, meal_id);
  });

  test('Should Add meals based on category id #Najdi', () {
    int category_id = 102;
    int meal_id = 1022; // القرصان
    List<Meal> mealsList = MealsData().mealsData;
    List<Meal> meals = [];
    expect(addMeals(mealsList, category_id, meals).elementAt(1).id, meal_id);
  });
}
