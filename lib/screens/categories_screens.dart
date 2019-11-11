import 'package:flutter/material.dart';
import '../dummy-data.dart';
import '../widgets/category_item.dart';

class CategoriesSCreen extends StatelessWidget {
    static const String routName = '/categories';
  @override
  Widget build(BuildContext context) {
    return GridView(
        
        padding: EdgeInsets.all(15),
        children: DUMMY_CATEGORIES.map((catData) {
          return CategoryItem(catData.id , catData.title, catData.color);
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          
          maxCrossAxisExtent: MediaQuery.of(context).size.shortestSide<600?200:600,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      );
  }
}
