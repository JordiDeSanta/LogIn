import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ));

    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            _createBG(context),
          ],
        ),
      ),
    );
  }

  Widget _createBG(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final purpleBG = Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ],
        ),
      ),
    );

    final circle = Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );

    return Stack(
      children: [
        purpleBG,
        Positioned(child: circle, top: 90.0, left: 30.0),
        Positioned(child: circle, bottom: 30.0, right: 30.0),
      ],
    );
  }
}
