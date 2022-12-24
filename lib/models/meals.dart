class Meal {
  final int id;
  final String name;
  final List categories;
  final bool isVegan;
  final bool isVegetarian;
  final bool haveMilk;
  final bool haveMeat;
  final bool haveEgg;
  final bool haveWheat;
  final List<String> ingredient;
  final List<String> addsOn;

  Meal(
      this.id,
      this.name,
      this.categories,
      this.isVegan,
      this.isVegetarian,
      this.haveMilk,
      this.haveMeat,
      this.haveEgg,
      this.haveWheat,
      this.ingredient,
      this.addsOn);
}
