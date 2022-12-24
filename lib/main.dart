import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/screens/categories_screen.dart';
import 'package:lets_eat_saudi/widgets/category_item.dart';
import 'package:lets_eat_saudi/widgets/meal_item.dart';

void main() {
  runApp(const LetsEatSaudi());
}

class LetsEatSaudi extends StatelessWidget {
  const LetsEatSaudi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromRGBO(214, 214, 187, 1);
    const secondaryColor = Color.fromRGBO(149, 39, 57, 1);
    return MaterialApp(
      checkerboardOffscreenLayers: true,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: backgroundColor,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: backgroundColor,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: secondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          )),
      home: const CategoriesScreen(),
    );
  }
}
