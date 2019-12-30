import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer_content.dart';

class FiltersScreen extends StatefulWidget {
  static const routename = 'FiltersScreen';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isglutenfree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Adjust Your Meal Selection',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            Divider(),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    title: Text('Gluten Free'),
                    subtitle: Text('If you want your Meal to be Gluten Free'),
                    value: _isglutenfree,
                    onChanged: (bool newVal) {
                      setState(() {
                        _isglutenfree = newVal;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose Free'),
                    subtitle: Text('If you want your Meal to be Lactose Free'),
                    value: _lactosefree,
                    onChanged: (bool newVal) {
                      setState(() {
                        _lactosefree = newVal;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    subtitle: Text('If you want your Meal to be Vegan'),
                    value: _vegan,
                    onChanged: (bool newVal) {
                      setState(() {
                        _vegan = newVal;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegatarian'),
                    subtitle: Text('If you\'re a pussy'),
                    value: _vegetarian,
                    onChanged: (bool newVal) {
                      setState(() {
                        _vegetarian = newVal;
                      });
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
