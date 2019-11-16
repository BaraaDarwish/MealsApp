import 'package:flutter/material.dart';
import '../dummy-data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routName = '/meal_details';

  Widget buildSectionTitle(title) {
    return Container(
      child: Text(title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'RobotoCondensed')),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 150,
        width: 300,
        child: child);
  }

  void _favorite(mealID) {
    DUMMY_MEALS.firstWhere((meal) {
      if (meal.id == mealID) {
        if (meal.isFavorite)
          meal.isFavorite = false;
        else
          meal.isFavorite = true;
        return meal.id == mealID;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
        actions: <Widget>[
          InkWell(
            child:
                Icon(selectedMeal.isFavorite ? Icons.star : Icons.star_border),
            onTap: () => {_favorite(selectedMeal.id)},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              Container(
                  color: Theme.of(context).accentColor,
                  child: ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) => Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                          selectedMeal.ingredients[index],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      color: Theme.of(context).accentColor,
                    ),
                  )),
            ),
            buildSectionTitle('Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        '# ${(index + 1)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      backgroundColor: Theme.of(context).accentColor,
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  )
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
