import 'package:flutter_test/flutter_test.dart';
import 'package:lets_eat_saudi/screens/meal_info_screen.dart';

void main() {
  test('Test box height calculator', () {
    // setup
    List list = [1, 2, 3];
    // do
    // test
    expect(calcListHeight(list), 80);
  });

  test('Test box height calculator for reviews section', () {
    // setup
    List emptyList = [];
    List list = [1, 2, 3];
    // do
    expect(calcReviewSectionHeight(emptyList), 60);
    expect(calcReviewSectionHeight(list), 220);
  });
}
