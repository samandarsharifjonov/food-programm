import 'package:flutter/material.dart';
import 'package:ovqatlar/screens/add_products_screen.dart';
import 'package:ovqatlar/widgets/main_dawer.dart';

import '../models/meals.dart';

class ProductsScreen extends StatelessWidget {
  final List<Meal> meals;
  final Function delete;
  const ProductsScreen({super.key, required this.meals, required this.delete});
  static const routName = "/products";

  void _goToAddProductPage(BuildContext context){
    Navigator.of(context).pushNamed(AddProductScreen.routName);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
         title: const Text("Mahsulotlar", style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
        actions: [
          IconButton(onPressed: () => _goToAddProductPage(context), icon: const Icon(Icons.add, size: 35,))
        ],
      ),
      drawer: const MainDrawer(),
      body: meals.length > 0 ? ListView.builder(
        itemCount: meals.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.amber,
              child: ListTile(
                leading: CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: AssetImage(meals[index].imgUrl),),
                title: Text(meals[index].title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                subtitle: Text("\$${meals[index].price}"),
                trailing: IconButton(onPressed: () {
                  delete(meals[index].id);
                }, icon: const Icon(Icons.delete, color: Colors.red,),),
              ),
            );

          },
      ) : const Center(child: Text("Mahsulotlar bo'limi bo'sh"))
    );
  }
}
