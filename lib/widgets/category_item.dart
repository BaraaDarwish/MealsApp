import 'package:flutter/material.dart';
import 'package:meals_app/screens/categorey_meals_screen.dart';


class CategoryItem extends StatelessWidget {

  final Color color;
  final String title;
  final String id;

  CategoryItem(
    this.id,
    this.title,
    this.color
  );
  void selectCategory(ctx){
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.routName,arguments: {'id' : this.id , 'title': this.title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
       borderRadius: BorderRadius.circular(15),
          child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title , style:Theme.of(context).textTheme.title,),
decoration: BoxDecoration(gradient: LinearGradient(
  colors:[
  color.withOpacity(0.5) , 
  color],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight),
  borderRadius: BorderRadius.circular(15)),          ),
    );
  }
}