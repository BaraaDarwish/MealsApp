import 'package:flutter/material.dart';
import './screens/categories_screens.dart';
import 'screens/categorey_meals_screen.dart';
import './screens/meal_detals_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: TabsScreen(),
      routes: {
        CategoryMealsScreen.routName: (ctx) => CategoryMealsScreen(),
        MealDetailsScreen.routName: (ctx) => MealDetailsScreen(),
        FiltersScreen.routName: (ctx) => FiltersScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesSCreen());
      },
    );
  }
}
