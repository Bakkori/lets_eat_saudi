// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lets_eat_saudi/models/data/favorites.dart';
import 'package:lets_eat_saudi/models/data/reviews.dart';
import 'package:lets_eat_saudi/screens/allergies_sheet.dart';

import 'package:lets_eat_saudi/screens/categories_screen.dart';
import 'package:lets_eat_saudi/screens/diet_sheet.dart';
import 'package:lets_eat_saudi/screens/favorites_screen.dart';
import 'package:lets_eat_saudi/screens/meal_info_screen.dart';
import 'package:lets_eat_saudi/screens/meals_screen.dart';
import 'package:lets_eat_saudi/widgets/favorite_item.dart';
import 'package:provider/provider.dart';

void main() {
  setUpAll(() => HttpOverrides.global = null);
  testWidgets('Check regions are exist', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CategoriesScreen()));

    expect(find.text('حجازي'), findsOneWidget);
    expect(find.text('نجدي'), findsOneWidget);
    expect(find.text('مغربي'), findsNothing);

    await tester.tap(find.text('حجازي'));
  });

  testWidgets('Check scrolling for Hijazi meals screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MealsScreen(category_id: 101)));

    await tester.drag(find.byType(GridView), const Offset(0, -100));
    await tester.pump();

    expect(find.text('المعصوب'), findsOneWidget);
  });

  testWidgets('Check scrolling for Qasim meals', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MealsScreen(category_id: 103)));

    await tester.drag(find.byType(GridView), const Offset(0, -600));
    await tester.pump();

    expect(find.text('الكليجا'), findsOneWidget);
  });

  testWidgets('Find some Hijazi meals', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MealsScreen(category_id: 101)));

    // Verify that our counter starts at 0.
    expect(find.text('المعصوب'), findsOneWidget);
    expect(find.text('ثريد'), findsOneWidget);
    expect(find.text('الكليجا'), findsNothing);
  });

  testWidgets('Find some Qasim meals', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MealsScreen(category_id: 103)));

    // Verify that our counter starts at 0.
    expect(find.text('المراصيع'), findsOneWidget);
    expect(find.text('القرصان'), findsOneWidget);
    expect(find.text('المعصوب'), findsNothing);
  });

  testWidgets('Find title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MealsScreen(category_id: 104)));

    // Verify that our counter starts at 0.
    expect(find.text('الأطباق'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('الوجبات'), findsNothing);
  });

  testWidgets('Find Images', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MealsScreen(category_id: 104)));
    expect(find.byType(Image), findsWidgets);
  });

  testWidgets('Check List of allergies', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: AllergiesSheet(
      id: 1011,
    )));
    expect(find.text('هل يتوفر به بيض؟'), findsOneWidget);
    expect(find.text('هل يتوفر به لحم؟'), findsOneWidget);
    expect(find.text('هل يتوفر به حليب؟'), findsOneWidget);
    expect(find.text('هل يتوفر به قمح؟'), findsOneWidget);
  });

  testWidgets('Check List of diets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: DietSheet(
      id: 1011,
    )));
    expect(find.text('مناسب للحمية النباتية؟'), findsOneWidget);
    expect(find.text('مناسب للحمية النباتية القاسية؟'), findsOneWidget);
  });
  testWidgets('Render meals details page', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Reviews()),
        ChangeNotifierProvider(create: (ctx) => Favorites()),
      ],
      child: MaterialApp(
        home: MealInfoScreen(
            mealName: 'المعصوب',
            imageUrl:
                'https://menu360.me/wp-content/uploads/2021/08/0Y2A0110.jpg',
            ingredients: ['ingredients'],
            addsOn: ['addsOn'],
            id: 1011,
            source:
                'https://menu360.me/wp-content/uploads/2021/08/0Y2A0110.jpg'),
      ),
    ));
  });

  testWidgets('Check PopupMenuButton in meals details page',
      (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Reviews()),
        ChangeNotifierProvider(create: (ctx) => Favorites()),
      ],
      child: MaterialApp(
        home: MealInfoScreen(
            mealName: 'المعصوب',
            imageUrl:
                'https://menu360.me/wp-content/uploads/2021/08/0Y2A0110.jpg',
            ingredients: ['ingredients'],
            addsOn: ['addsOn'],
            id: 1011,
            source:
                'https://menu360.me/wp-content/uploads/2021/08/0Y2A0110.jpg'),
      ),
    ));

    var pupMenuButton = find.byType(PopupMenuButton);
    await tester.tap(pupMenuButton);
    await tester.pump();
  });
  testWidgets('Render favorites page', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Favorites()),
      ],
      child: MaterialApp(home: FavoritesScreen()),
    ));

    expect(find.text('المفضلة'), findsOneWidget);
    expect(find.text('الأطباق'), findsNothing);
  });

  testWidgets('check scrollong for favorites page',
      (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Favorites()),
      ],
      child: MaterialApp(home: FavoritesScreen()),
    ));

    await tester.drag(find.byType(ListView), const Offset(0, -100));
    await tester.pump();
  });
}
