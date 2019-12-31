import 'package:flutter/material.dart';
import 'package:meals_app/dummydata.dart';

class MealDeatilsScreen extends StatefulWidget {
  static const routename = '/meal-details';

  final Function toggleFavorite;
  final Function checkFav;

  MealDeatilsScreen(this.toggleFavorite, this.checkFav);

  @override
  _MealDeatilsScreenState createState() => _MealDeatilsScreenState();
}

class _MealDeatilsScreenState extends State<MealDeatilsScreen> {
  final GlobalKey<ScaffoldState> mealDetailsScaffoldkey =
      GlobalKey<ScaffoldState>();
  _showSnackBarPositive() {
    final snackbar = SnackBar(
      content: Text('Added to Favorites'),
      backgroundColor: Colors.green,
      duration: Duration(seconds: 1),
    );
    mealDetailsScaffoldkey.currentState.showSnackBar(snackbar);
  }

  _showSnackBarNegative() {
    final snackbar = SnackBar(
      content: Text('Removed from Favorites'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 1),
    );
    mealDetailsScaffoldkey.currentState.showSnackBar(snackbar);
  }

  Widget buildSectionTile(BuildContext context, List<String> someList) {
    return Container(
      //color: Colors.white,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(top: 10),
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: someList.length,
          itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(someList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Divider(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              )),
    );
  }

  List<Widget> iconList = [
    Icon(Icons.star_border),
    Icon(Icons.star),
  ];

  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      key: mealDetailsScaffoldkey,
      appBar: AppBar(
        title: Text(selectedMeal.title),
        actions: <Widget>[
          IconButton(
            icon: (widget.checkFav(mealId))
                ? Icon(Icons.star)
                : Icon(Icons.star_border),
            onPressed: () {
              setState(() {
                widget.toggleFavorite(selectedMeal.id);
                if (widget.checkFav(mealId)) {
                  _showSnackBarPositive();
                } else {
                  _showSnackBarNegative();
                }
              });
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                selectedMeal.title,
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(
                height: 10,
              ),
              Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'INGREDIENTS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              buildSectionTile(context, selectedMeal.ingredients),
              SizedBox(
                height: 10,
              ),
              Text(
                'STEPS',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              buildSectionTile(context, selectedMeal.steps),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
