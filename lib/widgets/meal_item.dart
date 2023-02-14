import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/screens/meals_screen.dart';

class MealItem extends StatefulWidget {
  const MealItem({Key? key, required this.imageUrl, required this.name})
      : super(key: key);

  final String imageUrl;
  final String name;

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: Image.network(
                widget.imageUrl,
                height: 120,
                width: 150,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                      height: 100,
                      width: 100,
                      child: Center(child: Text('Could not load image!')));
                },
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : Container(
                          margin: EdgeInsets.all(15),
                          padding: EdgeInsets.all(15),
                          child: CircularProgressIndicator(
                            semanticsLabel: 'Loading',
                            color: Theme.of(context).splashColor,
                          ));
                },
              )),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
            child: Container(
              child: Center(
                  child: Text(
                widget.name.trim(),
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              )),
              width: 150,
              height: 30,
              color: Colors.redAccent,
            ),
          )
        ],
      ),
    );
  }
}
