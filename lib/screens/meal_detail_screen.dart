import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;
  const MealDetailScreen(
      {super.key, required this.toggleFavorite, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    Widget buildSectionTile(String text) {
      return Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ));
    }

    Widget buildContainer(Widget child) {
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 150,
          width: 340,
          child: child);
    }

    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((element) {
      return element.id.contains(mealId);
    });

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => toggleFavorite(mealId),
              icon: isFavorite(mealId)
                  ? const Icon(Icons.star)
                  : const Icon(Icons.star_outline))
        ],
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTile('Ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: ((context, index) => Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  )),
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTile('Steps'),
            buildContainer(ListView.builder(
              itemBuilder: ((ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text(
                            '# ${(index + 1)}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          selectedMeal.steps[index],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      if (index < selectedMeal.steps.length - 1)
                        const Divider(
                          thickness: 1,
                        )
                    ],
                  )),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.delete),
      //   onPressed: () {
      //     Navigator.of(context).pop(mealId);
      //   },
      // ),
    );
  }
}
