import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen({super.key, required this.favoriteMeals});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void didChangeDependencies() {
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return widget.favoriteMeals.isEmpty
        ? const Center(
            child: Text(
              'You have no favorites yet\nstart adding some!',
              style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          )
        : ListView.builder(
            itemBuilder: ((context, index) {
              return MealItem(
                id: widget.favoriteMeals[index].id,
                affordability: widget.favoriteMeals[index].affordability,
                complexity: widget.favoriteMeals[index].complexity,
                duration: widget.favoriteMeals[index].duration,
                imageUrl: widget.favoriteMeals[index].imageUrl,
                title: widget.favoriteMeals[index].title,
                removeFun: () {},
              );
            }),
            itemCount: widget.favoriteMeals.length,
          );
  }
}
