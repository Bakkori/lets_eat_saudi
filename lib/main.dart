import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/models/data/favorites.dart';
import 'package:lets_eat_saudi/models/data/reviews.dart';
import 'package:lets_eat_saudi/screens/categories_screen.dart';
import './translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: const LetsEatSaudi()));
}

class LetsEatSaudi extends StatelessWidget {
  const LetsEatSaudi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const backgroundColor = Color.fromRGBO(214, 214, 187, 1);
    const secondaryColor = Color.fromRGBO(149, 39, 57, 1);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Reviews()),
        ChangeNotifierProvider(create: (ctx) => Favorites()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Let's Eat Saudi",
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            useMaterial3: true,
            //  androidOverscrollIndicator: AndroidOverscrollIndicator.stretch,
            backgroundColor: backgroundColor,
            splashColor: secondaryColor,
            inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black))),
            appBarTheme: const AppBarTheme(
              foregroundColor: secondaryColor,
              centerTitle: true,
              backgroundColor: backgroundColor,
              elevation: 0,
              titleTextStyle: TextStyle(
                  color: secondaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    color: Theme.of(context).splashColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                button: const TextStyle(color: backgroundColor)),
          ),
          home: const CategoriesScreen()),
    );
  }
}
