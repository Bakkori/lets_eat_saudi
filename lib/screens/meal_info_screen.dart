import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:lets_eat_saudi/models/data/reviews.dart';
import 'package:lets_eat_saudi/models/review.dart';
import 'package:lets_eat_saudi/screens/allergies_sheet.dart';
import 'package:lets_eat_saudi/screens/diet_sheet.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MealInfoScreen extends StatefulWidget {
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
  State<MealInfoScreen> createState() => _MealInfoScreenState();
}

class _MealInfoScreenState extends State<MealInfoScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    final reviewsData = Provider.of<Reviews>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.mealName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              widget.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                setButton(context, 'معلومات الحساسية', 0, widget.id),
                setButton(context, 'معلومات الحمية الغذائية', 1, widget.id)
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
                height: calcListHeight(widget.ingredients),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Center(child: Text(widget.ingredients[index]));
                    })),
            Text(
              'الإضافات',
              style: TextStyle(
                  color: Theme.of(context).splashColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
                height: calcListHeight(widget.addsOn),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.addsOn.length,
                    itemBuilder: (ctx, index) {
                      return Center(child: Text(widget.addsOn[index]));
                    })),
            reviewListBuilder(widget.id, reviewsData),
            TextButton.icon(
              style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.black12),
                  foregroundColor:
                      MaterialStateProperty.all(Theme.of(context).splashColor)),
              onPressed: () {
                showReviewSection(context, widget.id, reviewsData);
              },
              icon: const Icon(
                Icons.draw_rounded,
              ),
              label: const Text(
                'أكتب تقييمك',
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<String?> showReviewSection(
      BuildContext context, int id, Reviews reviews) {
    TextEditingController review = TextEditingController();
    void sumbit() {
      setState(() {
        reviews.addReviw(review.text, id);
        Navigator.of(context).pop();
      });
    }

    return showDialog<String?>(
        context: context,
        builder: ((context) => AlertDialog(
              backgroundColor: Theme.of(context).backgroundColor,
              title: const Text('أكتب تقيمك'),
              content: TextField(
                autofocus: true,
                controller: review,
                onSubmitted: ((value) {
                  sumbit();
                  reviews.printRev();
                }),
              ),
              actions: [
                TextButton(
                    child: Text(
                      'تم',
                      style: TextStyle(color: Theme.of(context).splashColor),
                    ),
                    onPressed: sumbit),
              ],
            )));
  }

  Container reviewListBuilder(int id, Reviews reviews) {
    double sizedBoxHeight = calcReviewSectionHeight(reviews.getReviews(id));
    return Container(
      height: sizedBoxHeight,
      color: Colors.black12,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            'التقييمات والآراء',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Flexible(
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reviews.getReviews(id).length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text('5/4.7'),
                    trailing:
                        Text(reviews.getReviews(id).elementAt(index).review),
                  );
                }),
          ),
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
      margin: const EdgeInsets.all(15),
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

double calcListHeight(List list) {
  return list.length * 30;
}

double calcReviewSectionHeight(List list) {
  return (list.length * 60) + 40;
}

showBottomSheet(BuildContext context, Widget buttomSheet) {
  return showModalBottomSheet(
      backgroundColor: Theme.of(context).backgroundColor,
      context: context,
      builder: (context) {
        return Center(child: buttomSheet);
      });
}
