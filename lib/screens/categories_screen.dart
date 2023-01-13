import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CatergoriesScreen extends StatelessWidget {
  const CatergoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: dummyCategories.map((catData) {
        return CategoryItem(
          color: catData.color,
          title: catData.title,
          id: catData.id,
        );
      }).toList(),
    );
  }
}
