import 'package:flutter/material.dart';
import 'package:meals_app/widgets/drawer_content.dart';

class FiltersScreen extends StatelessWidget {
  static const routename = 'FiltersScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Center(
          child: Text('Filters Screen'),
        ),
      ),
    );
  }
}
