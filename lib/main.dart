import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/reviews.dart';
import 'package:lets_eat_saudi/screens/categories_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const LetsEatSaudi());
}

class LetsEatSaudi extends StatelessWidget {
  const LetsEatSaudi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromRGBO(214, 214, 187, 1);
    const secondaryColor = Color.fromRGBO(149, 39, 57, 1);
    return ChangeNotifierProvider(
      create: (context) => Reviews(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Let's Eat Saudi",
          theme: ThemeData(
            useMaterial3: true,
            //  androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
            backgroundColor: backgroundColor,
            splashColor: secondaryColor,
            appBarTheme: const AppBarTheme(
              foregroundColor: secondaryColor,
              centerTitle: true,
              backgroundColor: backgroundColor,
              elevation: 0,
              titleTextStyle: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    color: Theme.of(context).splashColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                button: const TextStyle(color: backgroundColor)),
          ),
          home: const CategoriesScreen()),
    );
  }
}
