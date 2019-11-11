import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy-data.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const String routName = '/categoryMeals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
        super.didChangeDependencies();

    if(!_loadedInitData){
        super.initState();
    /*final routeArgs = ModalRoute.of(context).settings.arguments as Map<String , String>;
    final categoryID = routeArgs['id'];
    categoryTitle = routeArgs['title'];
    displayedMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryID);
    }).toList();*/
     displayedMeals = DUMMY_MEALS;
    _loadedInitData = true;
    
    }
  }
  
  void _removeItem(String mealID){
      setState(() {
       displayedMeals.removeWhere((meal)=> meal.id == mealID );
      });
  }

  @override
  Widget build(BuildContext context) {
    
        return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(35.0),
              child: AppBar(
          
          title:  Text(categoryTitle),
        ),
      ),
      body: displayedMeals.length > 0 ?
      ListView.builder(itemBuilder: (ctx , i){
          return MealItem(title: displayedMeals[i].title,
          imageUrl: displayedMeals[i].imageUrl,
          duration: displayedMeals[i].duration,
          complexity: displayedMeals[i].complexity,
          affordabilit: displayedMeals[i].affordability,
          id:displayedMeals[i].id, 
          removeItem: _removeItem,
          );
      },itemCount: displayedMeals.length,)
      :
      Text("no meals"),
    );
  }
}