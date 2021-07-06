import 'package:flutter/material.dart';
import 'package:login/src/bloc/provider.dart';

import 'package:login/src/pages/home_page.dart';
import 'package:login/src/pages/login_page.dart';
import 'package:login/src/pages/product_page.dart';
import 'package:login/src/pages/register_page.dart';
import 'package:login/src/user_preferences/user_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = new UserPreferences();
    print(prefs.token);

    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Log In App',
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LogInPage(),
          'home': (BuildContext context) => HomePage(),
          'product': (BuildContext context) => ProductPage(),
          'logup': (BuildContext context) => RegisterPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
