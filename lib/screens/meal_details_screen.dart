import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ovqatlar/models/meals.dart';

class MealDetails extends StatefulWidget {
  const MealDetails({super.key});
  static const routName = "meal-details";

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {


  @override
  Widget build(BuildContext context) {
    final mealData = ModalRoute.of(context)!.settings.arguments as Meal;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(mealData.title),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                mealData.imgUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
              const SizedBox(height: 15),
              Text(
                "\$${mealData.price}",
                style: const TextStyle(fontSize: 25),
              ),
                Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Tarifi:",
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(mealData.description, style: const TextStyle(fontSize: 18, color: Colors.grey),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              mealData.ingredients.length > 0 ? SizedBox(
                height:  MediaQuery.of(context).size.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      child: ListView.separated(itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("$index ${mealData.ingredients[index]}", style: const TextStyle(fontSize: 14, color: Colors.grey),),
                      ), separatorBuilder: (context, index) => const Divider(), itemCount: mealData.ingredients.length),
                    ),
                  ),
              ) : Container(),

            ],
          ),
        ));
  }
}

