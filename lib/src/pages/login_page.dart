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
            _loginForm(context),
          ],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final TextStyle style = TextStyle(
      fontSize: 20,
    );

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          SafeArea(
            child: Container(
              height: 180,
            ),
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 30.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.4),
                  offset: Offset(0.0, 3.0),
                  blurRadius: 3.0,
                  spreadRadius: 3.0,
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  'Log In',
                  style: style,
                ),
                _createEmail(),
                _createPassword(),
                _createButton(),
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Text('Forgot password?',
              style: TextStyle(fontWeight: FontWeight.w300)),
          SizedBox(height: 100.0),
        ],
      ),
    );
  }

  Widget _createEmail() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: TextField(
        cursorColor: Colors.deepPurple,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple),
          labelStyle: TextStyle(color: Colors.black26),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          hintText: 'example@mail.com',
          labelText: 'E-Mail',
        ),
      ),
    );
  }

  Widget _createPassword() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      child: TextField(
        cursorColor: Colors.deepPurple,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.vpn_key_outlined, color: Colors.deepPurple),
          labelStyle: TextStyle(color: Colors.black26),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          hoverColor: Colors.deepPurple,
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _createButton() {
    final TextStyle style = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.w300,
    );

    return Padding(
      padding: EdgeInsets.only(top: 30.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          elevation: MaterialStateProperty.all(0.0),
          textStyle: MaterialStateProperty.all(style),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 15.0),
          child: Text('Log In'),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _createBG(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final TextStyle style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w300,
      fontSize: 30,
    );

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

    final person = Center(
      child: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            Icon(
              Icons.person_pin_circle,
              color: Colors.white,
              size: 100.0,
            ),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            Text(
              'Jordi Silva',
              style: style,
            ),
          ],
        ),
      ),
    );

    return Stack(
      children: [
        purpleBG,
        Positioned(child: circle, top: 90.0, left: 30.0),
        Positioned(child: circle, top: 160.0, left: 250.0),
        person,
      ],
    );
  }
}
