import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  final List<Meal> availableMeals;
  const CategoryMealsScreen({super.key, required this.availableMeals});
  static const routeName = '/category-meals';

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  var _loadedInItdata = false;
  late List<Meal> displayedMeals;
  @override
  void didChangeDependencies() {
    if (!_loadedInItdata) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where(
        //where save a variable if the condition is true with every check
        (meal) {
          return meal.categories.contains(
              categoryId); //contains check a list if it has a variable that is equall to argument in contains and return a bool
        },
      ).toList();
      _loadedInItdata = false;
    }

    super.didChangeDependencies();
  }

  void _removeFun(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  // const CategoryMealsScreen(
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            id: displayedMeals[index].id,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            removeFun: () {},
          );
        }),
        itemCount: displayedMeals.length,
      ),
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
    );
  }
}
