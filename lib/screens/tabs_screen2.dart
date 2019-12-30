import 'package:flutter/material.dart';
import '../widgets/drawer_content.dart';
import './cat_screen.dart';
import './fav_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routename = 'TabsScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _pages = [
    CategoryScreen(),
    FavoritesScreen(),
  ];

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
