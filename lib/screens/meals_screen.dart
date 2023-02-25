import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/meals_data.dart';
import 'package:lets_eat_saudi/screens/meal_info_screen.dart';
import 'package:lets_eat_saudi/widgets/meal_item.dart';
import '../models/meals.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({Key? key, required this.category_id}) : super(key: key);

  final int category_id;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List<Meal> mealsList = MealsData().mealsData;
  List<Meal> meals = [];

  @override
  void initState() {
    meals = addMeals(mealsList, widget.category_id, meals);
    super.initState();
  }

  // This method will add the meals based on the selected category. Note that
  // some meals belong to more than one category, that's why i made this
  // inner loops

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('الأطباق'),
      ),
      body: (meals.isNotEmpty)
          ? GridView.builder(
              itemCount: meals.length,
              padding: const EdgeInsets.all(15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MealInfoScreen(
                        id: meals[index].id,
                        mealName: meals[index].name.trim(),
                        imageUrl: meals[index].imageUrl,
                        ingredients: meals[index].ingredients,
                        addsOn: meals[index].addsOn,
                        source: meals[index].source,
                      );
                    }));
                  },
                  child: MealItem(
                      imageUrl: meals[index].imageUrl, name: meals[index].name),
                );
              })
          : const Center(
              child: Text('لاتوجد أطباق متاحة'),
            ),
    );
  }
}

List<Meal> addMeals(List<Meal> mealsList, int category_id, List<Meal> meals) {
  for (var i = 0; i < mealsList.length; i++) {
    for (var j = 0; j < mealsList[i].categories.length; j++) {
      if (mealsList[i].categories[j] == category_id) {
        meals.add(mealsList[i]);
      }
    }
  }
  return meals;
}
