
import 'package:flutter/material.dart';
import 'package:ovqatlar/models/category.dart';
import 'package:ovqatlar/screens/categories_screen.dart';
import 'package:ovqatlar/screens/favorite.dart';

import '../models/meals.dart';
import '../widgets/main_dawer.dart';

class TabScreen extends StatefulWidget {
  final List<Category> category;
  final Meals mealModal;
  final Function isFavorite;
  final Function toggleLike;
     const TabScreen({required this.category, required this.mealModal, required this.isFavorite, required this.toggleLike});
     static const routName = "/initial";

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
   int tabIndex = 0;

    List<Map<String, dynamic>> _list =  [];

    _changeTab(int index){
     setState(() {
       tabIndex = index;
     });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list = [
    {
      "page":  CategoriesScreen(mealsModel: widget.mealModal.mealsList, categories: widget.category),
      "title" : "Ovqatlar menyusi",
    },
    {
    "page":  Favorites(favorites: widget.mealModal.favorites, isFavorite: widget.isFavorite, toggleLike: widget.toggleLike),
    "title": "Sevimlilar"
    }
    ];

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(_list[tabIndex]["title"], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),)
      ),

      drawer: const MainDrawer(),

      body: _list[tabIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
          fixedColor: Colors.black,
          backgroundColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          iconSize: 25,
          onTap: _changeTab,
          currentIndex: tabIndex,
        items: const [
           BottomNavigationBarItem(
               label: "Barchsi",
               icon: Icon(Icons.more_horiz)),
          BottomNavigationBarItem(
              label: "Sevimlilar",
              icon: Icon(Icons.favorite)),
        ],
      ),
    );
  }
}
