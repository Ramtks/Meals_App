import 'package:flutter/material.dart';
import './dummy_data.dart';
import './models/meal.dart';
import '../screens/filters_screen.dart';
import '../screens/category_meals_screen.dart';
import '../screens/tabs_screen.dart';
import '../screens/categories_screen.dart';
import '../screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availbleMeals = dummyMeals;
  List<Meal> _favoriteMeals = [];
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  void _setFilters(Map<String, bool> filteredData) {
    setState(() {
      _filters = filteredData;
      _availbleMeals = dummyMeals.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) =>
        meal.id ==
        mealId); //it checks if an element is in the list and return its index and if it is not return -1 as an index
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFacorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: const CatergoriesScreen(),
      initialRoute: '/', //default is '/'
      routes: {
        '/': (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        CategoryMealsScreen.routeName: (context) =>
            CategoryMealsScreen(availableMeals: _availbleMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavorite: _toggleFavorite, isFavorite: _isMealFacorite),
        FiltersScreens.routeName: (context) => FiltersScreens(
              currentFilters: _filters,
              saveFilters: _setFilters,
            )
      },
      // onGenerateRoute: (settings) {
      //   //the on generateroute is required when u r not sure that u have the next page like in dynamic routing so it will put a default route in case of that
      //   print(settings.arguments);
      //   return null;
      //   //  if(settings.name==/meals-detail){
      //   //   return ...;

      //   // }
      //   // return MaterialPageRoute(builder: (ctx) => CatergoriesScreen());
      // },
      onUnknownRoute: ((settings) {
        // a good example is like we open a link to a page that got deleted the website will show a default page which for example shows oh that page has been deleted
        //this is called when we defined nothing in the routes or ongenerateroute as a last approach before an error appears
        return MaterialPageRoute(
            builder: (context) => const CatergoriesScreen());
      }),
      title: 'DeliMeals',
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              titleTextStyle: ThemeData.light()
                  .textTheme
                  .copyWith(
                      headline6: const TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 20,
                          fontWeight: FontWeight.w500))
                  .titleLarge),
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodySmall: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyLarge: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontFamily: 'Raleway',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              titleLarge: const TextStyle(
                  fontSize: 22,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.w300)),
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
              .copyWith(secondary: Colors.amber),
          fontFamily: 'Raleway'),
    );
  }
}
