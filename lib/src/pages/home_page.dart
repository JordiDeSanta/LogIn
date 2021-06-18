import 'package:flutter/material.dart';
import 'package:login/src/bloc/provider.dart';
import 'package:login/src/models/product_model.dart';
import 'package:login/src/providers/product_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final productsProvider = new ProductsProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
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
          final products = snapshot.data;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) => _createItem(context, products[i]),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _createItem(BuildContext context, ProductModel product) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: UniqueKey(),
      child: ListTile(
        title: Text(product.title + " - " + product.value.toString()),
        subtitle: Text(product.id),
        onTap: () => Navigator.pushNamed(context, 'product', arguments: product)
            .then((value) => setState(() {})),
      ),
      onDismissed: (d) {
        productsProvider.deleteProduct(product.id);
      },
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.arrow_forward_ios),
      onPressed: () {
        Navigator.pushNamed(context, 'product')
            .then((value) => setState(() {}));
      },
    );
  }
}
