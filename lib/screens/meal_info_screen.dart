import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/reviews.dart';
import 'package:lets_eat_saudi/screens/allergies_sheet.dart';
import 'package:lets_eat_saudi/screens/diet_sheet.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MealInfoScreen extends StatefulWidget {
  const MealInfoScreen(
      {Key? key,
      required this.mealName,
      required this.imageUrl,
      required this.ingredients,
      required this.addsOn,
      required this.id,
      required this.source})
      : super(key: key);
  final int id;
  final String mealName;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> addsOn;
  final String source;

  @override
  State<MealInfoScreen> createState() => _MealInfoScreenState();
}

class _MealInfoScreenState extends State<MealInfoScreen> {
  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open $url';
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    final reviewsData = Provider.of<Reviews>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.mealName),
        actions: [
          PopupMenuButton(
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Text('اذهب إلى مصدر المعلومات'),
                      onTap: () => _openUrl(widget.source),
                    ),
                    PopupMenuItem(
                      child: Text('اذهب إلى مصدر الصورة'),
                      onTap: () => _openUrl(widget.imageUrl),
                    ),
                  ])
        ],
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
                      return Center(
                          child: Text(widget.ingredients[index].trim()));
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
                      return Center(child: Text(widget.addsOn[index].trim()));
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
                cursorColor: Colors.black,
                textDirection: TextDirection.rtl,
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
    bool isEmpty = reviews.getReviews(id).isEmpty;
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
          (!isEmpty)
              ? Flexible(
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: reviews.getReviews(id).length,
                      itemBuilder: (ctx, index) {
                        return ListTile(
                          title: Text('5/...'),
                          trailing: Text(
                              reviews.getReviews(id).elementAt(index).review),
                        );
                      }),
                )
              : const Flexible(
                  child: Center(
                    child: Text('لا توجد تقييمات بعد'),
                  ),
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
  return (list.length * 20) + 20;
}

double calcReviewSectionHeight(List list) {
  if (list.isEmpty) {
    return 60;
  }
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
