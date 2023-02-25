import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/meals_data.dart';
import 'package:lets_eat_saudi/models/meals.dart';
import 'package:lets_eat_saudi/screens/meal_info_screen.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem(
      {Key? key,
      required this.mealId,
      required this.mealName,
      required this.imageUrl})
      : super(key: key);

  int mealId;
  String mealName;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    List<Meal> meals = MealsData().mealsData;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.redAccent),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.delete),
            ),
            InkWell(
              onTap: showMeal(meals, context),
              child: Text(
                mealName,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),
            InkWell(
              onTap: showMeal(meals, context),
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      topRight: Radius.circular(25)),
                  child: Image.network(
                    imageUrl,
                    height: 75,
                    width: 75,
                    fit: BoxFit.cover,
                  )),
            )
          ]),
        ));
  }

  showMeal(List<Meal> meals, BuildContext context) {
    return () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MealInfoScreen(
          id: meals.firstWhere((meal) => meal.id == mealId).id,
          mealName: meals.firstWhere((meal) => meal.id == mealId).name.trim(),
          imageUrl: meals.firstWhere((meal) => meal.id == mealId).imageUrl,
          ingredients:
              meals.firstWhere((meal) => meal.id == mealId).ingredients,
          addsOn: meals.firstWhere((meal) => meal.id == mealId).addsOn,
          source: meals.firstWhere((meal) => meal.id == mealId).source,
        );
      }));
    };
  }
}
