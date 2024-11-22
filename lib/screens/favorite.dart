  import 'package:flutter/material.dart';
import 'package:ovqatlar/widgets/meal_item.dart';
import '../models/meals.dart';

class Favorites extends StatefulWidget {
  final List<Meal> favorites;
  final Function isFavorite;
  final Function toggleLike;
  const Favorites({super.key, required this.favorites, required this.toggleLike, required this.isFavorite});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  void _toggleLike(String mealId){
    setState(() {
      widget.toggleLike(mealId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
         content: const Text("Sevimlida taom o'chirildi"),
        action: SnackBarAction(label: "BEKOR QILISH", onPressed: () {
          setState(() {
            widget.toggleLike(mealId);
          });
        },),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.favorites.length > 0 ? ListView.builder(
      itemCount: widget.favorites.length,
      itemBuilder: (context, index) {
        return MealItem(
            meal: widget.favorites[index],
            toggleLike: _toggleLike,
            isfavorite: widget.isFavorite,
            );
      },
    ) : const Center(child:  Text("Sevimlida taomlar mavjud emas", style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.grey
    ),),);
  }
}
