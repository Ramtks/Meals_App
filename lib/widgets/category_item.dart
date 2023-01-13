import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(
      {super.key, required this.color, required this.title, required this.id});
  void selectCategory(BuildContext ctx) {
    //this is push named routes way
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'id': id, 'title': title});
  }

  // Navigator.of(ctx).push(MaterialPageRoute(builder: (_) { //this is a push routes way
  //   return CategoryMealsScreen(
  //     categoryId: id,
  //     categoryTitle: title,
  //   );
  // }));
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
            borderRadius: BorderRadius.circular(15)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
