enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final Complexity complexity;
  final int duration;
  final List<String> steps;
  final Affordability affordability;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isGlutenFree;
  final bool isVegetarian;
  const Meal(
      {required this.id,
      required this.categories,
      required this.imageUrl,
      required this.title,
      required this.ingredients,
      required this.complexity,
      required this.steps,
      required this.duration,
      required this.affordability,
      required this.isGlutenFree,
      required this.isLactoseFree,
      required this.isVegan,
      required this.isVegetarian});
}
