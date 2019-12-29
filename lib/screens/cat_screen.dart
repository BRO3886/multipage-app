import 'package:flutter/material.dart';

import '../dummydata.dart';
import '../widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  final List dummyList = DUMMY_CATEGORIES.map((item) {
    return CategoryItem(item.id,item.title, item.color);
  }).toList();


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: EdgeInsets.all(18),
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: dummyList,
    );
  }
}
