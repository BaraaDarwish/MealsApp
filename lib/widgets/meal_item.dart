import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import '../screens/meal_detals_screen.dart';

import 'package:flutter/foundation.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordabilit;
  final Function removeItem;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordabilit,
   this.removeItem,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        {
          return 'Simple';
        }
      case Complexity.Hard:
        {
          return 'Hard';
        }
      case Complexity.Challenging:
        {
          return 'Challenging';
        }
      default:
        {
          return 'UNKNOWN';
        }
    }
  }

    String get affordabilityText {
    switch (affordabilit) {
      case Affordability.Affordable:
        {
          return 'Affordable';
        }
      case Affordability.Luxurious:
        {
          return 'Luxurious';
        }
      case Affordability.Pricey:
        {
          return 'Pricey';
        }
      default:
        {
          return 'UNKNOWN';
        }
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routName , 
    arguments: id).then((result) {
        if(result != null){
          removeItem(result);
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        width: 350,
                        color: Colors.black45,
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 20,
                        ),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[


                  //duration
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(" $duration mins"),
                    ],
                  ),

                  //Complexity
                  Row(                   
                    children: <Widget>[
                      Icon(
                        Icons.work,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(" $complexityText"),
                    ],
                  ),

                  //Affordability
                  Row(                  
                    children: <Widget>[
                      Icon(
                        Icons.attach_money,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(" $affordabilityText"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
