
import 'package:ovqatlar/img/images.dart';
final myImages = MyImages();

class Meal{
  final String id;
  final String title;
  final String imgUrl;
  final String description;
  final List<String> ingredients;
  final int time;
  final double price;
  final String categoryId;


  Meal({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.description,
    required this.ingredients,
    required this.time,
    required this.price,
    required this.categoryId,

  });
}

class Meals {
  final List<Meal> _mealsList = [
    Meal(
        id: "m1",
        title: "Burger",
        imgUrl: myImages.fastFoodImgFastFood5,
        description: "Ajoyib va mazali burger",
        ingredients: [],
        time: 12,
        price: 8,
        categoryId: "c1",
    ),
    Meal(
        id: "m2",
        title: "Burgrer",
        imgUrl: myImages.fastFoodImgFastFood2 ,
        description: "BIG burger",
        ingredients: [],
        time: 4,
        price: 2,
        categoryId: "c1",
    ),
    Meal(
      id: "m3",
      title: "Pizza",
      imgUrl: myImages.fastFoodImgFastFood3 ,
      description: "Qoziqorinli va mazali Pizza",
      ingredients: ["Qoziqorin", "Shokolad"],
      time: 20,
      price: 10,
      categoryId: "c1",
    ),
    Meal(
      id: "m4",
      title: "KFC",
      imgUrl: myImages.fastFoodImgFastFood4 ,
      description: "Ajoyib va mazali KFC",
      ingredients: ["Tovuq go'shti"],
      time: 10,
      price: 8.5,
      categoryId: "c1",
    ),
    Meal(id: "m5",
        title: "Go'shtli salat",
        imgUrl: myImages.saladsImgSalad1,
        description: "Go'sht va karamdan tayyorlangan ajoyib salat",
        ingredients: ["Karam", "Ot go'shti", "Piyoz", "mayanez"], time: 5, price: 20, categoryId: "c6"),
    Meal(id: "m6",
        title: "Qovurma lag'mon",
        imgUrl: myImages.uzbekNationalMealsImgMeal1,
        description: "Ajoyib va mazali qovurma lag'mon",
        ingredients: [], time: 5, price: 3.5, categoryId: "c2"),
    Meal(id: "m7",
        title: "To'y oshi",
        imgUrl: myImages.uzbekNationalMealsImgMeal2,
        description: "To'y oshi",
        ingredients: ["Qazi", "bedana tuxum", "go'sht", "Xorazim guruchi", "Qizil sabzi"], time: 8, price: 4.0, categoryId: "c2")
  ];

  List<Meal> get mealsList => _mealsList;

  List<Meal> _favorites = [];
  List<Meal> get favorites => _favorites;

  toggleLike(String mealId){
    final mealIndex = _favorites.indexWhere((element) => element.id == mealId);

    if(mealIndex < 0){
      _favorites.add(_mealsList.firstWhere((element) => element.id == mealId));
    }else{
      _favorites.removeWhere((element) => element.id == mealId);
    }
  }

  delete(String id){
    print('delete');
    _mealsList.removeWhere((element) => element.id == id);
  }

  void addNewMeal(Meal meal){
    _mealsList.add(meal);
  }

}