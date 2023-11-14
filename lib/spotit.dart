import 'package:flutter/material.dart';
//import 'package:titiiiiiiii/other/boxs.dart';
//import 'package:titiiiiiiii/other/cart.dart';
//import 'package:titiiiiiiii/other/kkcc.dart';
//import 'package:flutter/material.dart';

class SpotIfy extends StatelessWidget {
  final String name;

  final String image;
  SpotIfy({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              Icon(
                Icons.shopping_basket_outlined,
                color: Colors.black,
              )
            ],
          ),
          body: Container(
              child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(
                      image,
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width * 0.85,
                    ),
                  ),
                  Text(
                    name,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  Text('plant are good we should protect themsckknkjihxswa',
                      textAlign: TextAlign.start),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Container(
                      //alignment: Alignment(),
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 9, 228, 16),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Icon(Icons.arrow_upward_outlined),
                                    Text(
                                      'idk',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('fruhasedjscx'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.fireplace),
                                    Text(
                                      'temprature',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('20c to 30c'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Icon(Icons.local_hotel),
                                    Text(
                                      'pot',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('creamy pot'),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'total price',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextButton(
                                    //color: Color.fromARGB(255, 20, 24, 20),
                                    child: Text(
                                      'add to cart',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            )
                          ]),
                    ),
                  )
                ]),
          )));
    });
  }
}
