import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const TabsScreen({super.key, required this.favoriteMeals});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {
  // final List<Appbarstuff> _mytabs = [
  //   Appbarstuff(color: Colors.pink, title: 'Meals'),
  //   Appbarstuff(color: Colors.red, title: 'Perfecto Meals')
  // ];
  // late Appbarstuff _handler;
  // late TabController _controller;
  // @override
  // void initState() {
  //   super.initState();
  //   _controller = TabController(length: 2, vsync: this);
  //   _handler = _mytabs[0];
  //   _controller.addListener(handleSelected);
  // }

  // void handleSelected() {
  //   setState(() {
  //     _handler = _mytabs[_controller.index];
  //   });
  // }

  late List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {'page': const CatergoriesScreen(), 'title': 'Categories'},
      {
        'page': FavoritesScreen(favoriteMeals: widget.favoriteMeals),
        'title': 'Your Favorite'
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? iq = 'categories';
    String? iq2 = 'Favorites';
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: const Drawer(
        child: MainDrawer(),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onTap: _selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: iq,
                icon: const Icon(Icons.category)),
            BottomNavigationBarItem(
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: iq2,
                icon: const Icon(Icons.star))
          ]),
    );
  }
//     return DefaultTabController(
//         length: 2,
//         initialIndex: 0,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text(_handler.title),
//             backgroundColor: _handler.color,
//             bottom: TabBar(controller: _controller, tabs: const [
//               Tab(
//                 icon: Icon(Icons.category),
//                 child: Text('Categories'),
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 child: Text('Favorites'),
//               )
//             ]),
//           ),
//           body: TabBarView(
//               controller: _controller,
//               children: const [CatergoriesScreen(), FavoritesScreen()]),
//         ));
//   }
// }

// class Appbarstuff {
//   final String title;
//   final Color color;
//   Appbarstuff({required this.color, required this.title});
// }
}
