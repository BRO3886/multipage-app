import 'package:flutter/material.dart';
import '../widgets/drawer_content.dart';
import './cat_screen.dart';
import './fav_screen.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  static const routename = 'TabsScreen';
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      CategoryScreen(),
      FavoritesScreen(widget.favoriteMeals),
    ];  
  }

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('MealsApp'),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        unselectedItemColor: Colors.transparent.withOpacity(0.5),
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white.withOpacity(0.5),
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.category,
              ),
              title: Text('Categories')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(
                Icons.star,
              ),
              title: Text('Favorites')),
        ],
        onTap: _selectPage,
      ),
    );
  }
}
