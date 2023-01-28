import 'package:lets_eat_saudi/models/meals.dart';

class MealsData {
  get mealsData {
    return [
      Meal(
          1011,
          'المعصوب',
          [101],
          true,
          true,
          false,
          false,
          false,
          true,
          ['موز', 'فطيرة'],
          ['عسل', 'قشطة', 'سمن', 'حليب مبخر'],
          'https://menu360.me/wp-content/uploads/2021/08/0Y2A0110.jpg',
          ''),
      Meal(
          1012,
          'السليق الطائفي',
          [101],
          false,
          false,
          true,
          true,
          false,
          false,
          [
            '3x دجاج أو لحم',
            'ارز مصري',
            'فص مستكة',
            'حبوب هيل',
            'بصلة',
            'فلفل أبيض',
            'زبدة',
            'حليب سائل'
          ],
          ['السمن البري'],
          'https://cdn.alweb.com/thumbs/recipes/article/fit727x484/%D8%B7%D8%B1%D9%8A%D9%82%D8%A9-%D8%B9%D9%85%D9%84-%D8%A7%D9%84%D8%B3%D9%84%D9%8A%D9%82-%D8%A7%D9%84%D8%B7%D8%A7%D8%A6%D9%81%D9%8A.jpg',
          'https://cookpad.com/sa/وصفات/504279-طريقة-عمل-السليق-الطائفي'),  
          Meal(
          1013,
          ' ثريد   ',
          [101],
          false,
          false,
          false,
          true,
          false,
          true,
          [
            'الزبدة ',
            ' لحم غنم',
            'الفلفل الحار',
            ' القرنفل',
            'هيل ',
            ' الكركم ',
            'بهارات مشكلة',
          ],
          [' بالكزبرة المفرومة'],
          'https://modo3.com/thumbs/fit630x300/147754/1481539129/%D9%85%D8%A7_%D9%87%D9%8A_%D8%A3%D9%83%D9%84%D8%A9_%D8%A7%D9%84%D8%AB%D8%B1%D9%8A%D8%AF.jpg',
          'https://kitchen.sayidaty.net/node/6760/ثريد-اللحم-السعودي/أكلات-اللحوم'),
    ];
  }
}
