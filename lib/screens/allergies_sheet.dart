import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/data/meals_data.dart';
import 'package:lets_eat_saudi/models/meals.dart';

class AllergiesSheet extends StatelessWidget {
  const AllergiesSheet({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    List<Meal> meals = MealsData().mealsData;
    Meal meal = meals.firstWhere((meal) => meal.id == id);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(getYesOrNo(meal.haveMilk)),
                SizedBox(
                  width: 100,
                ),
                const Text('هل يتوفر به حليب؟'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

String getYesOrNo(bool value) {
  if (value == true) {
    return 'Yes';
  } else {
    return 'No';
  }
}
