import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';
import '../screens/tabs_screen2.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(BuildContext context, IconData iconData,
      String textString, Function tapHandler) {
    return ListTile(
      leading: Icon(iconData),
      title: Text(
        textString,
        style: Theme.of(context).textTheme.title,
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Divider(),
          buildListTile(context, Icons.restaurant, 'Meals', () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routename);
          }),
          Divider(),
          buildListTile(context, Icons.settings, 'Filters', () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routename);
          }),
          Divider(),
        ],
      ),
    );
  }
}
