import 'package:flutter/material.dart';

import '../models/meals.dart';
import './meal_details.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  FavoritesScreen(this.favoriteMeal);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: (widget.favoriteMeal.length == 0)
            ? Center(
                child: Text('You haven\'t added any favorites yet',
                    style: Theme.of(context).textTheme.caption),
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(widget.favoriteMeal[index].imageUrl)),
                    title: Text(
                      widget.favoriteMeal[index].title,
                      style: TextStyle(fontSize: 18),
                    ),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                          MealDeatilsScreen.routename,
                          arguments: widget.favoriteMeal[index].id);
                    },
                    
                  );
                },
                itemCount: widget.favoriteMeal.length,
              ));
  }
}
