import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lets_eat_saudi/data/meals_data.dart';
import 'package:lets_eat_saudi/models/meals.dart';

class AllergiesSheet extends StatelessWidget {
  const AllergiesSheet({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    List<Meal> meals = MealsData().mealsData;
    Meal meal = meals.firstWhere((meal) => meal.id == id);
    BuildContext ctx = context;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            allergicInfoCard('هل يتوفر به بيض؟', meal.haveEgg, '🥚'),
            allergicInfoCard('هل يتوفر به لحم؟', meal.haveMeat, '🥩'),
            allergicInfoCard('هل يتوفر به حليب؟', meal.haveMilk, '🥛'),
            allergicInfoCard('هل يتوفر به قمح؟', meal.haveWheat, '🌾'),
          ],
        ),
      ),
    );
  }

  Card allergicInfoCard(String question, bool element, String icon) {
    TextStyle style = const TextStyle(fontSize: 16);
    return Card(
      margin: EdgeInsets.all(2),
      color: Colors.white10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' ${getYesOrNo(element)} ',
            style: style,
          ),
          const SizedBox(
            width: 100,
          ),
          Row(
            children: [
              Text(' $icon '),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Text(
                  question,
                  style: style,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String getYesOrNo(bool value) {
  if (value == true) {
    return 'نعم';
  } else {
    return 'لا';
  }
}
