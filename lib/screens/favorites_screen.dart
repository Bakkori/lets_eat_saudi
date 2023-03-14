import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lets_eat_saudi/widgets/favorite_item.dart';
import 'package:lets_eat_saudi/models/data/favorites.dart';
import 'package:lets_eat_saudi/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesData = Provider.of<Favorites>(context);
    var favorites = favoritesData.favorites;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(LocaleKeys.favorites.tr()),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: ((context, index) {
            return FavoriteItem(
                mealId: favorites[index].mealId,
                mealName: favorites[index].mealName,
                imageUrl: favorites[index].imageUrl);
          })),
    );
  }
}
