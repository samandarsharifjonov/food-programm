import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});
  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();

}

class Img {
  final String img;
  Img({required this.img});
}

class _CarouselWidgetState extends State<CarouselWidget> {



   List<String> _imagesList = const [
     "assets/images/carousel_img/carouselImg1.png",
     "assets/images/carousel_img/carouselImg2.png",
     "assets/images/carousel_img/carouselImg3.png",
     "assets/images/carousel_img/carouselImg4.png",
     "assets/images/carousel_img/carouselImg5.png",
     "assets/images/carousel_img/carouselImg6.png",
   ];

   int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
            enlargeCenterPage: true,
            autoPlay: true,
            animateToClosest: true,
            disableCenter: true,
            autoPlayAnimationDuration: const  Duration(seconds: 4),
            viewportFraction: 1,
            height: h * 0.25,
          ),
          items: _imagesList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: w,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(i, fit: BoxFit.cover,)
                  )
                );
              },
            );
          }
          ).toList(),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            count: _imagesList.length,
            effect: const ExpandingDotsEffect( dotColor: Colors.grey, dotHeight: 8, dotWidth: 8, activeDotColor: Colors.amber),
          ),
        )
      ],
    );
  }
}