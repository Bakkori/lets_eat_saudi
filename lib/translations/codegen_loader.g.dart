// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "categories": "التصنيفات",
  "banana": "موز",
  "favorites": "المفضلة",
  "language": "اللغة",
  "choose_language ": "اختر اللغة",
  "regions": {
    "Hijazi": "حجازي",
    "Najdi": "نجدي",
    "Qasimi": "قصيمي",
    "Eastern": "شرقي",
    "Northern": "شمالي",
    "Southern": "جنوبي"
  }
};
static const Map<String,dynamic> en = {
  "categories": "Categories",
  "banana": "Banana",
  "favorites": "Favorites",
  "language": "Language",
  "choose_language ": "Choose the language",
  "regions": {
    "Hijazi": "Hijazi",
    "Najdi": "Najdi",
    "Qasimi": "Qasimi",
    "Eastern": "Eastern",
    "Northern": "Northern",
    "Southern": "Southern"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}
