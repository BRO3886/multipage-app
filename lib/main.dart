import 'package:flutter/material.dart';

import './screens/cat_screen.dart';
import './screens/cat_meals.dart';
import './screens/meal_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
                title: TextStyle(color: Colors.black54, fontSize: 27, fontWeight: FontWeight.bold),
              )),
      home: MyHomePage(),
      routes: {
        MealDeatilsScreen.routename: (ctx) =>MealDeatilsScreen(),
       CategoryMealsScreen.routename : (ctx) => CategoryMealsScreen()
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MealsApp'),
      ),
      body: CategoryScreen(),
    );
  }
}
