import 'dart:html';
//import '1drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:carousel_slider/';

class SliderPage extends StatelessWidget {
  const SliderPage({super.key});
  final url =
      "https://media.istockphoto.com/id/1460122390/photo/portrait-beauty-and-facial-with-a-black-woman-in-studio-to-promote-natural-skincare-or.jpg?s=1024x1024&w=is&k=20&c=OM9PF35xRZavW_xaS4Ru-3DVdJ_9HIy-VQHZMOLVBrk=";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("bv")),
      body: CarouselSlider(
        items: [1, 2, 3, 4, 5, 6, 7, 8, 9].map((i) {
          return Container(
            child: Image.network(url),
          );
        }).toList(),
        options: CarouselOptions(height: 400),
      ),
    );
  }
}
