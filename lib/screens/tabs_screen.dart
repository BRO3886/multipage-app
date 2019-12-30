import 'package:flutter/material.dart';
import './cat_screen.dart';
import './fav_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routename = 'TabsScreen';
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MealsApp'),
          bottom: TabBar(
            unselectedLabelColor: Colors.white.withOpacity(0.4),
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
