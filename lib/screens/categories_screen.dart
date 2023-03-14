import 'package:flutter/material.dart';
import '/models/data/categories_data.dart';
import '/models/category.dart';
import '/screens/favorites_screen.dart';
import '/widgets/category_item.dart';
//import 'generated/locale_keys.g.dart';

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
          title: Text('التصنيفات'),
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).backgroundColor,
          child: Column(
            children: [
              Container(
                height: 100,
                color: Colors.redAccent,
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('المفضلة'),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return FavoritesScreen();
                })),
              )
            ],
          ),
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
