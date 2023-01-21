import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/meals_data.dart';
import 'package:lets_eat_saudi/models/meals.dart';

class DietSheet extends StatelessWidget {
  const DietSheet({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    List<Meal> meals = MealsData().mealsData;
    Meal meal = meals.firstWhere((meal) => meal.id == id);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            dietInfoCard('مناسب للحمية النباتية؟', meal.isVegetarian, '🌿 '),
            dietInfoCard('مناسب للحمية النباتية القاسية؟', meal.isVegan, ' 🐮'),
            const SizedBox(
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(':ملاحظات'),
            ),
            const Text(
              'الحمية النباتية لا يسمح فيها بأكل اللحوميات-',
              textAlign: TextAlign.right,
            ),
            const Text(
              'الحمية النباتية القاسية لا يسمح فيها بأكل مشتقات الحيوان-',
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  Card dietInfoCard(String question, bool element, String icon) {
    TextStyle style = const TextStyle(fontSize: 16);
    return Card(
      margin: const EdgeInsets.all(2),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Column(
                  children: [
                    Text(
                      question,
                      style: style,
                      textAlign: TextAlign.right,
                    ),
                  ],
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
