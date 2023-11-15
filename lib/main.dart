import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newproj/1drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('am', 'ET'),
        Locale('fr', 'FR')
      ],
      path: 'assets/', // <-- change the path of the translation files
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

final _fromkey = GlobalKey<FormState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return const LoginPage();
      }),
    );
  } //PROFILEpage, drawer
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _usercontroller = TextEditingController();
  bool VisibleText = true;
  var error = "";

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "welcome back!",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: 40,
                  width: 490,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 44,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.all(15.0),
                      //elevation: 990,
                    ),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          Text(
                            'continue with google',
                            style: TextStyle(color: Colors.black),
                          )
                        ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "or login with",
                    style:
                        TextStyle(color: const Color.fromARGB(255, 56, 55, 55)),
                  ),
                  alignment: Alignment.topLeft,
                ),

                SizedBox(
                  height: 70,
                  child: TextFormField(
                    onFieldSubmitted: (value) {},
                    controller: _usercontroller,
                    decoration: InputDecoration(
                      hintText: "enter email address....",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 70,
                  child: Form(
                    key: _fromkey,
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                //Form
                Container(
                  height: 40,
                  width: 490,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: const Color.fromARGB(255, 1, 13, 34),
                      padding: EdgeInsets.all(20.0),
                      elevation: 10,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Drower(),
                          ));
                    },
                    child: Text("login").tr(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'forget password?',
                      style: TextStyle(decoration: (TextDecoration.underline)),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(2.0),
                  alignment: Alignment.topLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'sign in',
                      style: TextStyle(decoration: (TextDecoration.underline)),
                    ),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
