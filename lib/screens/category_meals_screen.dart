
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/meals.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final Function toggleLike;
  final Function isFavorite;
   const CategoriesMealsScreen({super.key, required this.toggleLike, required this.isFavorite});
  static const routName = "/category-meals";


  @override
  Widget build(BuildContext context) {
    print('hello world');
    final categoryData= ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = categoryData["categoryTitle"];
    final meals = categoryData["categoryMeals"] as List<Meal>;

    return  Scaffold(
      appBar: AppBar(
        title:  Text(title,
          style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: meals.length > 0 ?  ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
          return MealItem(meal: meals[index], toggleLike: toggleLike, isfavorite: isFavorite,);
        },) : const Center(child: Text("Bu menyu vaqtincha bo'sh", style: TextStyle(color: Colors.grey, fontSize: 20),),),
      )
    );
  }
}


