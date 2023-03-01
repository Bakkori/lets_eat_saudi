import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/favorites.dart';
import 'package:lets_eat_saudi/models/data/reviews.dart';
import 'package:lets_eat_saudi/screens/allergies_sheet.dart';
import 'package:lets_eat_saudi/screens/diet_sheet.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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

  late String imageSource;

  @override
  void initState() {
    imageSource = getSoruce(widget.imageUrl);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reviewsData = Provider.of<Reviews>(context);
    final favoritesData = Provider.of<Favorites>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(widget.mealName),
        actions: [
          PopupMenuButton(
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.info),
                          SizedBox(
                            width: 3,
                          ),
                          Text('اذهب إلى مصدر المعلومات'),
                        ],
                      ),
                      onTap: () => _openUrl(widget.source),
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.image),
                          SizedBox(
                            width: 3,
                          ),
                          Text('اذهب إلى مصدر الصورة'),
                        ],
                      ),
                      onTap: () => _openUrl(widget.imageUrl),
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.favorite),
                          SizedBox(
                            width: 3,
                          ),
                          Text('إضافة الطبق إلى المفضلة'),
                        ],
                      ),
                      onTap: () => favoritesData.addFavorite(
                          widget.id, widget.mealName, widget.imageUrl),
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
            (imageSource.isNotEmpty) ? imageSourceSection() : Placeholder(),
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
            ReviewsList(id: widget.id, reviews: reviewsData),
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

  Column imageSourceSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'مصدر الصورة',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            SizedBox(width: 3),
            Icon(
              Icons.link,
              color: Colors.grey[600],
              size: 20,
            )
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 30,
          child: InkWell(
            splashColor: Colors.black12,
            onTap: () {
              _openUrl(widget.imageUrl);
            },
            child: Card(
              color: Colors.white10,
              child: Text(
                ' ${widget.imageUrl} ',
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<String?> showReviewSection(
      BuildContext context, int id, Reviews reviews) {
    TextEditingController review = TextEditingController();
    double rating = 0;

    return showDialog<String?>(
        context: context,
        builder: ((context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).backgroundColor,
            title: const Text('أخبرنا عن رأيك'),
            content: SizedBox(
              height: 300,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  RatingBar.builder(
                    itemCount: 5,
                    initialRating: 1,
                    minRating: 1,
                    allowHalfRating: true,
                    direction: Axis.horizontal,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 3),
                    itemBuilder: (context, index) =>
                        const Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (value) {
                      rating = value;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    key: Key('reviewTextField'),
                    autofocus: true,
                    cursorColor: Colors.black,
                    textDirection: TextDirection.rtl,
                    controller: review,
                    decoration: InputDecoration(
                        labelText: 'المراجعة',
                        labelStyle:
                            TextStyle(color: Theme.of(context).splashColor)),
                    onSubmitted: ((value) {
                      sumbitReview(context, review, reviews, id, rating);
                    }),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                  key: Key('addReview'),
                  child: Text(
                    'تم',
                    style: TextStyle(color: Theme.of(context).splashColor),
                  ),
                  onPressed: (() {
                    sumbitReview(context, review, reviews, id, rating);
                  })),
            ],
          );
        }));
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

showBottomSheet(BuildContext context, Widget buttomSheet) {
  return showModalBottomSheet(
      backgroundColor: Theme.of(context).backgroundColor,
      context: context,
      builder: (context) {
        return Center(child: buttomSheet);
      });
}

void sumbitReview(BuildContext context, TextEditingController review,
    Reviews reviews, int id, double rating) {
  if (review.text.isEmpty) {
    Navigator.of(context).pop();
  } else {
    reviews.addReviw(review.text, id, rating);
    Navigator.of(context).pop();
  }
}

class ReviewsList extends StatelessWidget {
  const ReviewsList({
    Key? key,
    required this.id,
    required this.reviews,
  }) : super(key: key);

  final int id;
  final Reviews reviews;

  @override
  Widget build(BuildContext context) {
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
                          title: Text(
                              '${reviews.getReviews(id).elementAt(index).rating}'),
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

double calcReviewSectionHeight(List list) {
  if (list.isEmpty) {
    return 60;
  }
  return (list.length * 60) + 40;
}

String getSoruce(String url) {
  var tokens = url.split('.com');
  return tokens[0];
}
