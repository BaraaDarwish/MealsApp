import 'package:flutter/material.dart';
import 'package:meals_app/screens/categorey_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final Color color;
  final String title;
  final String id;

  CategoryItem(this.id, this.title, this.color);
  void selectCategory(ctx) {
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routName,
        arguments: {'id': this.id, 'title': this.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Card(
        elevation:5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(209, 199, 199, 0.7),
                Color.fromRGBO(209, 199, 199, 1),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
