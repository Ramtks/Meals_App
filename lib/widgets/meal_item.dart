import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeFun;
  const MealItem(
      {super.key,
      required this.id,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      required this.title,
      required this.removeFun});
  dynamic get complexityString {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        'Unknown';
    }
  }

  dynamic get affordabilityString {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Afforfable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(MealDetailScreen.routeName, arguments: id)
        .then((value) {
      if (value != null) removeFun(value);
    }); //here value is the passed data from navigator.pop in the meal detail screen
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit
                          .cover //this will resize and crop the image to fit it good,
                      ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)),
                        color: Colors.black54),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    width: 300,
                    child: Text(
                      title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work_outline_rounded),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityString)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money_outlined),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityString)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
