import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ovqatlar/models/meals.dart';
import 'package:ovqatlar/screens/add_products_screen.dart';
import 'package:ovqatlar/screens/tab_screen.dart';
import 'package:ovqatlar/models/category.dart';
import 'package:ovqatlar/screens/category_meals_screen.dart';
import 'package:ovqatlar/screens/meal_details_screen.dart';
import 'package:ovqatlar/screens/products_screen.dart';


main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final categoriesModel = Categories();

  final mealsModel = Meals();

  void _toggleLike(String mealsId){
    setState(() {
      mealsModel.toggleLike(mealsId);
    });
  }

  bool _isFavorite(String mealId){
    return mealsModel.favorites.any((element) => element.id == mealId);
  }

   delete(String id){
    setState(() {
      mealsModel.delete(id);
    });
  }

  void _addNewMeal(Meal meal){
    mealsModel.addNewMeal(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.kanit().fontFamily
      ),
      /*home:  CategoriesScreen(categories: categoriesModel.list, mealsModel:  mealsModel.mealsList),*/
      initialRoute: TabScreen.routName,
      routes: {
        TabScreen.routName : (context) =>  TabScreen(category: categoriesModel.list, mealModal: mealsModel, isFavorite: _isFavorite, toggleLike: _toggleLike,),
        CategoriesMealsScreen.routName : (ctx) =>   CategoriesMealsScreen(toggleLike: _toggleLike, isFavorite: _isFavorite,),
        MealDetails.routName: (context) => const  MealDetails(),
        ProductsScreen.routName: (context) =>  ProductsScreen(meals: mealsModel.mealsList, delete: delete),
        AddProductScreen.routName: (context) =>  AddProductScreen(categories: categoriesModel.list,addFunction: _addNewMeal, ),
      },
    );
  }
}
