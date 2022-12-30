import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/screens/allergies_sheet.dart';
import 'package:lets_eat_saudi/screens/diet_sheet.dart';

class MealInfoScreen extends StatelessWidget {
  const MealInfoScreen(
      {Key? key,
      required this.mealName,
      required this.imageUrl,
      required this.ingredients,
      required this.addsOn,
      required this.id})
      : super(key: key);
  final int id;
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
                setButton(context, 'معلومات الحساسية', 0, id),
                setButton(context, 'معلومات الحمية الغذائية', 1, id)
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
                height: calcHeight(ingredients),
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
                height: calcHeight(addsOn),
                child: ListView.builder(
                    itemCount: addsOn.length,
                    itemBuilder: (ctx, index) {
                      return Center(child: Text(addsOn[index]));
                    })),
          ],
        ),
      ),
    );
  }
}

setButton(BuildContext context, String title, int setOption, int id) {
  return InkWell(
    borderRadius: const BorderRadius.all(Radius.circular(15)),
    onTap: () {
      if (setOption == 0) {
        showBottomSheet(context, AllergiesSheet(id: id));
      }
      if (setOption == 1) {
        showBottomSheet(context, DietSheet(id: id));
      }
    },
    child: Container(
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
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: Theme.of(context).splashColor),
    ),
  );
}

double calcHeight(List<String> list) {
  return list.length * 30;
}

showBottomSheet(BuildContext context, Widget buttomSheet) {
  return showModalBottomSheet(
      backgroundColor: Theme.of(context).backgroundColor,
      context: context,
      builder: (context) {
        return Center(child: buttomSheet);
      });
}
