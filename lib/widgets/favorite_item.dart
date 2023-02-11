import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  FavoriteItem(
      {Key? key,
      required this.mealId,
      required this.mealName,
      required this.imageUrl})
      : super(key: key);

  int mealId;
  String mealName;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25), color: Colors.redAccent),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.delete),
            ),
            Text(
              mealName,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
            ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    topRight: Radius.circular(25)),
                child: Image.network(
                  imageUrl,
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ))
          ]),
        ));
  }
}
