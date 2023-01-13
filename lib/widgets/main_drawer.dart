import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  Widget buildListTile(IconData icon, String title, VoidCallback tapHandler) {
    //using this(builder method) or making a file for a new widget works fine but this can trigger the build method of all the widget here if it has something that trigger the build like a state so having a file for the widget will be better so it will trigeer the build method for itself only
    return ListTile(
      minLeadingWidth: 30,
      leading: SizedBox(
        height: double.infinity,
        child: Icon(
          icon,
          size: 26,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          alignment: Alignment
              .centerLeft, //alignment is for the child of the container and centerleft means it is centered vertically and left horizontally
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
                fontSize: 30),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        buildListTile(Icons.restaurant, 'Meals', (() {
          Navigator.of(context).pushReplacementNamed('/');
        })),
        buildListTile(Icons.settings, 'Filters', (() {
          Navigator.of(context).pushReplacementNamed(FiltersScreens.routeName);
        }))
      ],
    );
  }
}
