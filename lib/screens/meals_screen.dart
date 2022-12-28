import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/data/meals_data.dart';
import 'package:lets_eat_saudi/widgets/meal_item.dart';
import '../models/meals.dart';

class MealsScreen extends StatefulWidget {
  const MealsScreen({Key? key, required this.category_id}) : super(key: key);

  final int category_id;

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {
  List mealsList = MealsData().mealsData;
  List meals = [];

  @override
  void initState() {
    // there will be list of categories, make a method to get the desired meals
    // based on the category.
    for (var i = 0; i < mealsList.length; i++) {
      for (var j = 0; j < mealsList[i].categories.length; j++) {
        if (mealsList[i].categories[j] == widget.category_id) {
          meals.add(mealsList[i]);
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TO DO: create a function to make a list of meals for a specific category

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
                return MealItem(
                    imageUrl: meals[index].imageUrl, name: meals[index].name);
              })
          : const Center(
              child: Text('لاتوجد أطباق متاحة'),
            ),
    );
  }
}
