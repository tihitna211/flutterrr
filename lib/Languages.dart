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
        child: LanguageChanger()),
  );
}

class LanguageChanger extends StatelessWidget {
  const LanguageChanger({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Builder(builder: (context) {
        return Scaffold(
          body: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'welcome',
                style: TextStyle(fontFamily: "PowerGeez"),
              ).tr(),
              MaterialButton(
                  onPressed: () {
                    context.setLocale(Locale('en', 'US'));
                  },
                  child: Text('english'),
                  minWidth: 300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: (context.locale == Locale('en', 'US'))
                      ? Color.fromARGB(255, 82, 13, 146)
                      : Color.fromARGB(255, 232, 233, 229)),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  onPressed: () {
                    context.setLocale(Locale('am', 'ET'));
                  },
                  child: Text('amharic').tr(),
                  minWidth: 300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: (context.locale == Locale('am', 'ET'))
                      ? Color.fromARGB(255, 28, 10, 117)
                      : Color.fromARGB(255, 218, 216, 212)),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  onPressed: () {
                    context.setLocale(Locale('fr', 'FR'));
                  },
                  child: Text('franch'),
                  minWidth: 300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: (context.locale == Locale('fr', 'FR'))
                      ? Color.fromARGB(255, 28, 10, 117)
                      : Color.fromARGB(255, 218, 216, 212)),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                color: Colors.pink,
                child: Text('next').tr(),
                minWidth: 200,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.push((context), MaterialPageRoute(
                    builder: (context) {
                      return Drower();
                    },
                  ));
                },
              ),
            ],
          )),
        );
      }),
    );
  } //PROFILEpage, drawer
}
