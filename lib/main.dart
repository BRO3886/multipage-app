import 'package:flutter/material.dart';
import 'package:meals_app/dummydata.dart';
import './screens/filters_screen.dart';

import './screens/tabs_screen2.dart';
import './screens/cat_meals.dart';
import './screens/meal_details.dart';
import './models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  Map<String, bool> _filters = {
    'glutenFree': false,
    'lactoseFree': false,
    'vegan': false,
    'vegetarian': false,
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.deepPurple,
          canvasColor: Color.fromRGBO(255, 249, 224, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                    color: Colors.black54,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              )),
      home: TabsScreen(),
      routes: {
        TabsScreen.routename: (ctx) => TabsScreen(),
        FiltersScreen.routename: (ctx) => FiltersScreen(_filters,_setFilters),
        MealDeatilsScreen.routename: (ctx) => MealDeatilsScreen(),
        CategoryMealsScreen.routename: (ctx) =>
            CategoryMealsScreen(_availableMeals)
      },
    );
  }
}
