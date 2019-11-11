import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget listTilesBuilder(String title, IconData icon,Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'RobotoCondensed',
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {



    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          listTilesBuilder('Meals', Icons.restaurant ,
          (){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          listTilesBuilder('Filters', Icons.settings,
          (){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routName);

          }),
        ],
      ),
    );
  }
}
