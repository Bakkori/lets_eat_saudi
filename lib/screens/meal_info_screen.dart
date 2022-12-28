import 'package:flutter/material.dart';

class MealInfoScreen extends StatelessWidget {
  const MealInfoScreen(
      {Key? key, required this.mealName, required this.imageUrl})
      : super(key: key);
  final String mealName;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(mealName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Row(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
