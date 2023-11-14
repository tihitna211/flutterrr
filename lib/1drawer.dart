import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:newproj/Languages.dart';
import 'package:newproj/Slider.dart';
import 'package:newproj/main.dart';
import 'package:newproj/searchpage.dart';
//import 'package:newproj/main.dart';

class Drower extends StatefulWidget {
  Drower({super.key});

  @override
  State<Drower> createState() => _DrowerState();
}

class _DrowerState extends State<Drower> {
  final url =
      "https://media.istockphoto.com/id/1460122390/photo/portrait-beauty-and-facial-with-a-black-woman-in-studio-to-promote-natural-skincare-or.jpg?s=1024x1024&w=is&k=20&c=OM9PF35xRZavW_xaS4Ru-3DVdJ_9HIy-VQHZMOLVBrk=";

  bool Islight = false;
  String name = "tihitna";
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    SliderPage(),
    SeaechPage(),
    LoginPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _widgetOptions[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme:
              (Islight == true) ? ColorScheme.dark() : ColorScheme.light()),
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'welcome $name!',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 41, 42, 43)),
            ).tr(),
            centerTitle: true,
          ),
          drawer: Drawer(
            backgroundColor: (Islight == false)
                ? Color.fromARGB(255, 238, 155, 155)
                : Colors.grey[600],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color: (Islight == false)
                              ? Color.fromARGB(255, 238, 155, 155)
                              : Colors.grey[600],
                          backgroundBlendMode: BlendMode.color),
                      arrowColor: Colors.blueGrey,
                      accountEmail: Text("tihitnasol21@gmail.com"),
                      accountName: Text(name),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(url),
                      )),
                  ExpansionTile(
                    leading: Icon(Icons.settings),
                    title: Text('setting').tr(),
                    children: [
                      ListTile(
                          leading: const Icon(Icons.language),
                          title: Text('changelanguage').tr(),
                          trailing: Icon(Icons.check),
                          onTap: () {
                            Navigator.push(
                                (context),
                                MaterialPageRoute(
                                  builder: (context) => const LanguageChanger(),
                                ));
                          }),
                      SwitchListTile(
                        value: Islight,
                        onChanged: (value) {
                          setState(() {
                            Islight = !Islight;
                          });
                        },
                        secondary: const Icon(Icons.format_paint),
                        title: Text('change theme'),
                      ),
                    ],
                  ),
                  ListTile(
                      leading: Icon(Icons.person_2),
                      title: Text('profile').tr(),
                      trailing: Icon(Icons.check),
                      onTap: () {}),
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                    hintText: 'search', prefixIcon: Icon(Icons.search)),
              ),
              Text("Today is good day to learn something new thing!",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("trend courses",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                  TextButton(
                    child: Text('see all...'),
                    onPressed: () {},
                  )
                ],
              ),
              Flexible(
                flex: 1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Flexible(
                        child: Container(
                          child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                child: ListTile(
                                    //tileColor: Colors.blueGrey,
                                    leading: Icon(
                                      Icons.book_online,
                                      color: Colors.blue[900],
                                    ),
                                    title: Text(
                                      'reading',
                                    ),
                                    subtitle: Text(
                                      'u full person',
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Card(
                                child: ListTile(
                                    // tileColor: Colors.blueGrey,
                                    leading: Icon(
                                      Icons.book_online,
                                      color: Colors.blue[900],
                                    ),
                                    title: Text('writing'),
                                    subtitle: Text(
                                      ' full person',
                                    )),
                              ),
                            )
                          ]),
                          width: 220.0,
                          height: 200,
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("suggested for u",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                  TextButton(
                    child: Text('see all...'),
                    onPressed: () {},
                  )
                ],
              ),
              Flexible(
                flex: 1,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 200.0,
                        height: 200,
                        margin: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 173, 81, 81),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      );
                    }),
              ),
              BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'login',
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
