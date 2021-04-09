import 'package:flutter/material.dart';
import 'package:login/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Email: ${bloc.email}', overflow: TextOverflow.fade),
      ),
      body: Center(child: Text('Password:  ${bloc.password}')),
    );
  }
}
