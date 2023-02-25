import 'package:flutter_test/flutter_test.dart';
import 'package:lets_eat_saudi/screens/allergies_sheet.dart';

void main() {
  test('Test Yes or No method', () {
    expect(getYesOrNo(true), 'نعم');
    expect(getYesOrNo(false), 'لا');
  });
}
