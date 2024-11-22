import 'package:ovqatlar/generated/assets.dart';
import 'package:ovqatlar/img/images.dart';


  final myImages = MyImages();

class Category {
  final String id;
  final String title;
  final String imageUrl;
  Category({required this.id, required this.title, required this.imageUrl});
}

class Categories {
  List<Category> _list = [
    Category(
        id: 'c1', title: "Fast Food", imageUrl: myImages.fastFoodImgFastFood5),
    Category(
        id: 'c2', title: "Milliy Taomlar", imageUrl: myImages.screenImgPlov),
    Category(
        id: 'c3',
        title: "Italiya Taomlari",
        imageUrl: myImages.screenImgItalianFood),
    Category(
        id: 'c4',
        title: "Fransiya Taomlari",
        imageUrl: myImages.screenImgFranceFood),
    Category(
        id: 'c5', title: "Ichimliklar", imageUrl: myImages.drinksImgDrinks1),
    Category(id: 'c6', title: "Salatlar", imageUrl: myImages.saladsImgSalad1),
  ];
  List<Category> get list => _list;
}
