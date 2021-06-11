import 'package:flutter/material.dart';
import 'package:login/src/bloc/provider.dart';
import 'package:login/src/models/product_model.dart';
import 'package:login/src/providers/product_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final productsProvider = new ProductsProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      floatingActionButton: _createButton(context),
      body: _createProductList(),
    );
  }

  Widget _createProductList() {
    return FutureBuilder(
      future: productsProvider.loadProducts(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          return Container();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.arrow_forward_ios),
      onPressed: () {
        Navigator.pushNamed(context, 'product');
      },
    );
  }
}
