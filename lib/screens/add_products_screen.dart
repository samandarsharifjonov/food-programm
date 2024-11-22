import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import '../models/category.dart';
import '../models/meals.dart';
import 'custom_img_input.dart';

class AddProductScreen extends StatefulWidget {
  final List<Category> categories;
  final Function addFunction;

  const AddProductScreen({super.key, required this.categories, required this.addFunction});

  static const routName = "/add-product";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  late String categoryId;
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _priceController = TextEditingController();
  final _preparingTimeController = TextEditingController();
  final _mainImgController = TextEditingController();
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryId = widget.categories[0].id;
  }

  void _save(){
   setState(() {
     print("Saqlash ishladi");
     final title = _titleController.text;
     final descr = _descriptionController.text;
     final ingred = _ingredientsController.text;
     final price = _priceController.text;
     final prepTime = _preparingTimeController.text;
     final mainImg = _mainImgController.text;

     if(title.isEmpty || descr.isEmpty || ingred.isEmpty || price.isEmpty || prepTime.isEmpty || mainImg.isEmpty){
       return;
     }

     final List<String> ingreds = ingred.split(",");
     List<String> imgUrl = [mainImg];

     widget.addFunction(Meal(
         id: UniqueKey().toString(),
         title: title,
         imgUrl: imgUrl.first,
         description: descr,
         ingredients: ingreds,
         time: int.parse(prepTime),
         price: double.parse(price),
         categoryId: categoryId));
   }
   );

   Navigator.of(context).pop();

  }
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        automaticallyImplyLeading: true,
        title: const Text("Yangi taom qo'shish",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true,
                value: categoryId,
                onChanged: (id) {
                  setState(() {
                    categoryId = id as String;
                  });
                },
                items: widget.categories
                    .map((category) =>  DropdownMenuItem(
                          child: Center(
                              child: Text(
                            category.title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                          value: category.id,
                        ))
                    .toList(),
              ),
              TextField(
                decoration: const InputDecoration(
                  labelText: "Ovqat nomi",
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: const InputDecoration(labelText: "Ovqat tarifi"),
                controller: _descriptionController,
                maxLength: 100,
                cursorRadius: Radius.zero,
                maxLines: 5,
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText:
                        "Ovqat tarkibi, misol uchun: Go'sht, pomidor, ..."),
                maxLines: 1,
                controller: _ingredientsController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: "Narxi",
                ),
              ),
              TextField(
                controller: _preparingTimeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Tayorrlanish vaqti (minutda)."),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomImgInput(
                mainImgController: _mainImgController,
                labelText: "Rasim URL",
              ),

              Padding(
                padding:  const EdgeInsets.symmetric(vertical:  40),
                child: Container(
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.amber),
                    ),
                     onPressed: _save,
                    child: const Text("Saqlash"),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
