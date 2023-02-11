import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/meals_data.dart';
import 'package:lets_eat_saudi/models/meals.dart';
import 'package:lets_eat_saudi/widgets/favorite_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Meal> mealsList = MealsData().mealsData;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('المفضلة'),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
          itemCount: mealsList.length,
          itemBuilder: ((context, index) {
            return FavoriteItem(
                mealId: mealsList[index].id,
                mealName: mealsList[index].name,
                imageUrl: mealsList[index].imageUrl);
          })),
    );
  }
}
