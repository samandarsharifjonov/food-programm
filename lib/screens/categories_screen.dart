import 'package:flutter/material.dart';
import 'package:ovqatlar/generated/assets.dart';
import 'package:ovqatlar/img/images.dart';
import 'package:ovqatlar/widgets/category_item.dart';
import '../models/category.dart';
import '../models/meals.dart';
import '../widgets/carousel_widget.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Category> categories;
  final List<Meal> mealsModel;
   const CategoriesScreen({super.key, required this.categories, required this.mealsModel});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
   final myImages = MyImages();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
    /*  appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("Taomlar menyusi", style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,

        ),),
      ),*/
      //backgroundColor: Colors.deepOrange.shade500,
       /* appBar: AppBar(
          flexibleSpace: Stack(
              children: [
                Container(
                  width: double.infinity,
                  child: Image.asset(myImages.screenImgAppBarImg, fit:  BoxFit.cover,),
                ),

                Container(
                  color: Colors.black.withOpacity(0.6),
                ),
              ]
          ),
          toolbarHeight: 60,
          centerTitle: true,
          //backgroundColor: Colors.amber,
          title: const Text("Taomlar menyusi",
            style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold

            ),
          ),
        ),*/
        body: Stack(
          children: [
            Column(
              children: [
                const Padding(
                  padding:  EdgeInsets.symmetric(vertical: 10),
                  child: CarouselWidget(),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: widget.categories.length > 0 ? GridView(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        childAspectRatio: 3/2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        maxCrossAxisExtent: 200,
                      ),
                      children: widget.categories.map((e){
                        final categoryMeals = widget.mealsModel.where((element) => element.categoryId == e.id).toList();
                        return CategoryItem(categories: e, mealsModel: categoryMeals);
                      }).toList(),
                    ) :  Container(child: const Text("Kategorya vaqtincha bo'sh"),)
                  ),
                ),

              ],
            ),
          ],
        )


    );
  }
}



