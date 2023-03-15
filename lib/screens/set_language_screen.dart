import 'package:flutter/material.dart';
import 'package:lets_eat_saudi/screens/categories_screen.dart';
import 'package:lets_eat_saudi/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SetLanguageScreen extends StatefulWidget {
  const SetLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SetLanguageScreen> createState() => _SetLanguageScreenState();
}

class _SetLanguageScreenState extends State<SetLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.language.tr())),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(LocaleKeys.choose_language.tr()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.setLocale(Locale('ar'));
                    goToMainScreen();
                  },
                  child: Text(
                    'العربية',
                    style: TextStyle(color: Theme.of(context).splashColor),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.setLocale(Locale('en'));
                      goToMainScreen();
                    },
                    child: Text(
                      'English',
                      style: TextStyle(color: Theme.of(context).splashColor),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  goToMainScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CategoriesScreen();
    }));
  }
}
