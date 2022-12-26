import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/data/meals_data.dart';
import 'package:lets_eat_saudi/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({Key? key, required this.category_id}) : super(key: key);

  final category_id;

  @override
  Widget build(BuildContext context) {
    // TO DO: create a function to make a list of meals for a specific category
    List mealsList = MealsData().mealsData;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('الأطباق'),
      ),
      body: GridView.builder(
          itemCount: mealsList.length,
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (ctx, index) {
            return MealItem(
                imageUrl: mealsList[index].imageUrl,
                name: mealsList[index].name);
          }),
    );
  }
}
