import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'nextpage.dart';
import 'TheQr.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return const ForMobile();
      } else {
        return const ForTablet();
      }
    });
  }
}

class ForMobile extends StatefulWidget {
  const ForMobile({
    super.key,
  });

  @override
  State<ForMobile> createState() => _ForMobileState();
}

class _ForMobileState extends State<ForMobile> {
  Future register() async {
    var url =
        Uri.parse('http://192.168.1.3/flutter_api_updated-main/create.php');
    var response = await http
        .post(url, body: {'password': password.text, 'email': email.text});
    final Map<String, dynamic> data = json.decode(response.body);
    if (data['success']) {
      Fluttertoast.showToast(
          msg: "submitted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white);
      // Handle the non-error case here
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return NextPage();
        },
      ));
    } else {
      Fluttertoast.showToast(
          msg: "takennn ",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white);
    }
  }

// print(await http.read(
//   Uri.https('example.com', 'foobar.txt')));
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool VisibleText = true;

  var error = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Builder(builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset('assets/Asset 4.png',
                        width: MediaQuery.of(context).size.width * 0.55),
                    const SizedBox(height: 32),
                    TextButton(
                      onPressed: () {
                        register();
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return NextPage();
                        //   },
                        // ));
                      },
                      child: const Text(
                        'sign in',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.deepOrange,
                          hintText: 'email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 19),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width * 0.85,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Expanded(
                        child: TextField(
                          controller: password,
                          obscureText: VisibleText,
                          onChanged: (value) {
                            if (value.length < 8) {
                              setState(() {
                                error = "too short";
                              });
                            } else if (value.length >= 8 && value.length < 12) {
                              setState(() {
                                error = "medium";
                              });
                            }
                            // ignore: curly_braces_in_flow_control_structures
                            else {
                              setState(() {
                                error = "good!";
                              });
                            }
                            ;
                          },
                          decoration: InputDecoration(
                            errorText: error,
                            errorStyle: TextStyle(
                                color: (error == 'good!')
                                    ? Colors.green
                                    : (error == "too short")
                                        ? Colors.red
                                        : (error == 'medium')
                                            ? Colors.amber
                                            : null),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  VisibleText = !VisibleText;
                                });
                              },
                              icon: Icon((VisibleText)
                                  ? Icons.visibility
                                  : (!VisibleText)
                                      ? Icons.visibility_off_outlined
                                      : null),
                            ),
                            hintText: "password",
                            filled: true,
                            fillColor: Colors.deepOrange,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TheQr();
                          },
                        ));
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                              color: Color(0xffff3b00),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Image(
                            image: AssetImage(
                              'assets/Intersect.png',
                            ),
                            fit: BoxFit.cover,
                          )
                          // AssetImage('assets/intersect.png'),
                          ),
                    ))
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ForTablet extends StatefulWidget {
  const ForTablet({
    super.key,
  });

  @override
  State<ForTablet> createState() => _ForTabletState();
}

class _ForTabletState extends State<ForTablet> {
  var _usercontroller = TextEditingController();
  bool VisibleText = true;
  var error = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.grey,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      TextButton(
                        onPressed: () {
                          // register();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NextPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'sign in',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        //decoration: BoxDecoration(color: Colors.orange),
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.deepOrange,
                            hintText: 'email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 9),
                      Container(
                        //color: Colors.orange,
                        padding: const EdgeInsets.all(8.0),
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextFormField(
                          obscureText: VisibleText,
                          onChanged: (value) {
                            if (value.length < 8) {
                              setState(() {
                                error = "too short";
                              });
                            } else if (value.length >= 8 && value.length < 12) {
                              setState(() {
                                error = "medium";
                              });
                            }
                            // ignore: curly_braces_in_flow_control_structures
                            else {
                              setState(() {
                                error = "good!";
                              });
                            }
                            ;
                          },
                          decoration: InputDecoration(
                            errorText: error,
                            errorStyle: TextStyle(
                                color: (error == 'good!')
                                    ? Colors.green
                                    : (error == "too short")
                                        ? Colors.red
                                        : (error == 'medium')
                                            ? Colors.amber
                                            : null),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  VisibleText = !VisibleText;
                                });
                              },
                              icon: Icon((VisibleText)
                                  ? Icons.visibility
                                  : (!VisibleText)
                                      ? Icons.visibility_off_outlined
                                      : null),
                            ),
                            hintText: "password",
                            filled: true,
                            fillColor: Colors.deepOrange,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/Asset 4.png',
                          width: MediaQuery.of(context).size.width * 0.55),
                    ],
                  ),
                ),
                Expanded(
                    child: GestureDetector(
                  onDoubleTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return TheQr();
                      },
                    ));
                  },
                  child: Container(
                      //height: MediaQuery.of(context).size.height * 0.9,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(20)),
                      // child: const Image(
                      //   image: AssetImage(
                      //     'assets/Intersect.png',
                      //   ),
                      //   fit: BoxFit.cover,
                      // )
                      // AssetImage('assets/intersect.png'),
                      ),
                ))
              ]),
            ),
          ),
        );
      }),
    );
  }
}
