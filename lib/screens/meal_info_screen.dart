import 'package:flutter/material.dart';

class MealInfoScreen extends StatelessWidget {
  const MealInfoScreen(
      {Key? key,
      required this.mealName,
      required this.imageUrl,
      required this.ingredients,
      required this.addsOn})
      : super(key: key);
  final String mealName;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> addsOn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(mealName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                setButton(context, 'معلومات الحساسية'),
                setButton(context, 'معلومات الحمية الغذائية')
              ],
            ),
            Text(
              'المكونـــات',
              style: TextStyle(
                  color: Theme.of(context).splashColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
                height: 60,
                child: ListView.builder(
                    itemCount: ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Center(child: Text(ingredients[index]));
                    })),
            Text(
              'الإضافات',
              style: TextStyle(
                  color: Theme.of(context).splashColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Center(child: Text(addsOn[index]));
                    })),
          ],
        ),
      ),
    );
  }
}

setButton(BuildContext context, String title) {
  return Container(
    //padding: EdgeInsets.all(15),
    margin: EdgeInsets.all(15),
    height: 50,
    width: 150,
    child: Center(
        child: Text(
      title,
      style: Theme.of(context).textTheme.button,
    )),
    //   color: Colors.blueAccent,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: Theme.of(context).splashColor),
  );
}
