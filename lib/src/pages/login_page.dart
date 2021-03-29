import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Log In'),
        ),
      ),
    );
  }
}
