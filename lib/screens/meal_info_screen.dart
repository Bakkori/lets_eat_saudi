import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lets_eat_saudi/models/data/reviews.dart';
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
                    physics: const NeverScrollableScrollPhysics(),
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: addsOn.length,
                    itemBuilder: (ctx, index) {
                      return Center(child: Text(addsOn[index]));
                    })),
            reviewListBuilder(),
            TextButton.icon(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor:
                      MaterialStateProperty.all(Theme.of(context).splashColor)),
              onPressed: () {
                showReviewSection(context);
              },
              icon: Icon(
                Icons.draw_rounded,
              ),
              label: Text(
                'أكتب تقييمك',
              ),
            )
          ],
        ),
      ),
    );
  }

  Future showReviewSection(BuildContext context) {
    return showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              backgroundColor: Theme.of(context).backgroundColor,
              title: const Text('أكتب تقيمك'),
              content: TextField(),
              actions: [
                TextButton(
                  child: Text(
                    'تم',
                    style: TextStyle(color: Theme.of(context).splashColor),
                  ),
                  onPressed: () => {},
                )
              ],
            )));
  }

// (String rating, String review)
  Container reviewListBuilder() {
    // TODO:
    Reviews reviews = Reviews().getReviews();
    return Container(
      color: Colors.black12,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: const [
          Text(
            'التقييمات والآراء',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text('5/4.7'),
            trailing: Text('صراحة من أفضل الوجبات'),
          )
        ],
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
