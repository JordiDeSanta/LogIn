import 'package:flutter/material.dart';

import 'package:login/src/pages/home_page.dart';
import 'package:login/src/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log In App',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LogInPage(),
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
