import 'package:flutter/material.dart';
import 'package:ovqatlar/screens/category_meals_screen.dart';
import '../models/category.dart';
import '../models/meals.dart';
class CategoryItem extends StatelessWidget {
  final  Category categories;
  final List<Meal> mealsModel;
  const CategoryItem({required this.categories, required this.mealsModel});

  void goToMealsScreenPage(BuildContext context){
   /* Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  MealsScreenPage(categoryName: categories.title,),));*/
    Navigator.of(context).pushNamed(CategoriesMealsScreen.routName, arguments:{
      "categoryTitle": categories.title,
      "categoryMeals" : mealsModel,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        goToMealsScreenPage(context);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              color: Colors.amber,
              child: Image.asset(categories.imageUrl, fit: BoxFit.cover,),
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Text(categories.title, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
