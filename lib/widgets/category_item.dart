import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final String name;

  const CategoryItem({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MealsScreen(
            category_id: id,
          );
        }));
      },
      child: Stack(
        alignment: Alignment.center,
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
            padding: const EdgeInsets.only(bottom: 10),
          ),
          Center(
            child: Text(
              name,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ),
          )
        ],
      ),
    );
  }
}
