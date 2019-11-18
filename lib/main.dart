import 'package:flutter/material.dart';
import 'package:meals_app/dummy-data.dart';
import './screens/categories_screens.dart';
import 'screens/categorey_meals_screen.dart';
import './screens/meal_detals_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<Meal> _favoriteMeals = [];

    void _toggleFavorite(String mealID){
      final exisingIndex =_favoriteMeals.indexWhere((meal) => meal.id == mealID);
      if (exisingIndex >= 0){
        setState(() {
          _favoriteMeals.removeAt(exisingIndex);
        });
      }
      else{
        setState(() {
          _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealID ));

        });
      }
    }

    bool _isFavoriteMeal (String mealID){
    return _favoriteMeals.any((meal) => meal.id == mealID);

    }
    return MaterialApp(
      title: 'Mealsiato',
      theme: ThemeData(
          brightness: Brightness.dark,
          accentColor: Color.fromRGBO(214, 90, 49, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.dark().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'RobotoCondensed')),
          appBarTheme: AppBarTheme(
            color: Color.fromRGBO(57, 62, 70, 1),
          )),
      home: TabsScreen(_favoriteMeals),
      routes: {
        CategoryMealsScreen.routName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routName: (ctx) => MealDetailsScreen(  _isFavoriteMeal ,_toggleFavorite),
        FiltersScreen.routName: (ctx) => FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesSCreen());
      },
    );
  }
}
