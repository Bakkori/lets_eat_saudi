import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final String name;

  const CategoryItem({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            //   padding: EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'assets\\images\\categories\\$id.png',
              height: 409.45,
              width: 249.85,
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.only(bottom: 10),
        ),
        Positioned(
          child: Text(
            name,
            style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white70),
          ),
          bottom: 131,
          right: 58,
        )
      ],
    );
  }
}
