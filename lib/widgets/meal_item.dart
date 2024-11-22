import 'package:flutter/material.dart';
import 'package:ovqatlar/screens/meal_details_screen.dart';

import '../models/meals.dart';
class MealItem extends StatefulWidget {
  final Function toggleLike;
  final Meal meal;
  final Function isfavorite;

     const MealItem({super.key, required this.meal, required this.toggleLike, required this.isfavorite});

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  void _goToMealDetails(BuildContext context){
    Navigator.of(context).pushNamed(MealDetails.routName, arguments: widget.meal);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _goToMealDetails(context);
      },
      child: Card(
        child: Column(
          children: [
             Stack(
              children: [
                 ClipRRect(
                    borderRadius:  const BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                    child: Container(
                        height: 300,
                        width: double.infinity,
                        child: Image.asset(widget.meal.imgUrl, fit: BoxFit.cover,)
                    )
                 ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    width: 200,
                    color: Colors.black.withOpacity(0.8),
                    child:  Center(
                        child:  Text(widget.meal.title, style: const TextStyle(fontSize: 20, color: Colors.white),)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const  EdgeInsets.all(10.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {
                     widget.toggleLike(widget.meal.id);
                  },
                      icon:  widget.isfavorite(widget.meal.id) ? const Icon(Icons.favorite, color: Colors.red,) : const Icon(Icons.favorite_border_outlined, color: Colors.red,)),
                   Text("${widget.meal.time} min"),
                   Text("\$${widget.meal.price}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}