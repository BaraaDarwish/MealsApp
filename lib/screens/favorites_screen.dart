import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favorites;
  FavoritesScreen(this.favorites);
  @override
  Widget build(BuildContext context) {
    return favorites.length > 0
        ? ListView.builder(
      itemBuilder: (ctx, i) {
        return MealItem(
          title: favorites[i].title,
          imageUrl: favorites[i].imageUrl,
          duration: favorites[i].duration,
          complexity: favorites[i].complexity,
          affordabilit: favorites[i].affordability,
          id: favorites[i].id,

        );
      },
      itemCount: favorites.length,
    )
        : Text("You have no favorite Meals");
  }
}
