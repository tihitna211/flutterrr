import 'package:carousel_slider/carousel_slider.dart';
//import 'package:carousel_slider/utils.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SliderPage extends StatefulWidget {
  SliderPage({
    super.key,
  });

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final url =
      "https://media.istockphoto.com/id/1460122390/photo/portrait-beauty-and-facial-with-a-black-woman-in-studio-to-promote-natural-skincare-or.jpg?s=1024x1024&w=is&k=20&c=OM9PF35xRZavW_xaS4Ru-3DVdJ_9HIy-VQHZMOLVBrk=";

  final urlImages = [
    'https://media.istockphoto.com/id/1460007178/photo/library-books-on-table-and-background-for-studying-learning-and-research-in-education-school.webp?s=1024x1024&w=is&k=20&c=cuzIXmvKHLpoGxGIft9zCiTw-jeL0Gjp7UNZau0MNkk=',
    'https://media.istockphoto.com/id/803039496/photo/books-on-table-against-shelf-in-library-at-school.jpg?s=1024x1024&w=is&k=20&c=EG_B1AoCZL_lAfv4MCWr6LBRkL5M9-_taKGwGbKIDC4=',
    'https://media.istockphoto.com/id/1419410282/photo/silent-forest-in-spring-with-beautiful-bright-sun-rays.jpg?s=1024x1024&w=is&k=20&c=K8yBJVB-TtpPF1O2zOhVlzXECDxJsadlRrLf4gXXNkk='
  ];
  int activeindes = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("bv")),
        body: Column(
          children: [
            CarouselSlider.builder(
              itemBuilder: (context, index, realIndex) {
                final urlImage = urlImages[index];
                return buildImage(urlImage, index);
              },
              itemCount: 3,
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() => activeindes = index);
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            DotsIndicator(
              dotsCount: urlImages.length,
              position: activeindes,
            ),
          ],
        ));
  }

  Widget buildImage(String urlImage, int index) => Container(
        color: Colors.grey,
        margin: EdgeInsets.all(10.0),
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}
