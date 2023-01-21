import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/categories_data.dart';
import 'package:lets_eat_saudi/models/category.dart';
import 'package:lets_eat_saudi/widgets/category_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = CategoriesData().categoriesData;

  List<CategoryItem> categoriesWidgetList = [];
  setCategoriesWidgetList() {
    for (var i = 0; i < categories.length; i++) {
      categoriesWidgetList
          .add(CategoryItem(id: categories[i].id, name: categories[i].name));
    }
  }

  @override
  void initState() {
    super.initState();
    setCategoriesWidgetList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('التصنيفات'),
        ),
        backgroundColor: Theme.of(context).backgroundColor,
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 255 / 431,
          crossAxisSpacing: 15,
          padding: const EdgeInsets.all(15),
          children: [...categoriesWidgetList],
        ));
  }
}
