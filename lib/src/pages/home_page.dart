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
  @override
  Widget build(BuildContext context) {
    final productsBloc = Provider.productsBloc(context);
    productsBloc.loadProducts();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      floatingActionButton: _createButton(context),
      body: _createProductList(productsBloc),
    );
  }

  Widget _createProductList(ProductsBloc productsBloc) {
    return StreamBuilder(
      stream: productsBloc.productsStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.hasData) {
          final products = snapshot.data;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) =>
                _createItem(context, products[i], productsBloc),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
          );
        }
      },
    );
  }

  Widget _createItem(
      BuildContext context, ProductModel product, ProductsBloc productsBloc) {
    return Dismissible(
      background: Container(color: Colors.red),
      key: UniqueKey(),
      child: ListTile(
        leading: FadeInImage(
          width: 50,
          height: 50,
          fit: BoxFit.cover,
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: (product.photoUrl != null)
              ? NetworkImage(product.photoUrl)
              : AssetImage('assets/no-image.png'),
        ),
        title: Text(product.title + " - " + product.value.toString()),
        subtitle: Text(product.id),
        onTap: () => Navigator.pushNamed(context, 'product', arguments: product)
            .then((value) => setState(() {})),
      ),
      onDismissed: (d) => productsBloc.deleteProduct(product),
    );
  }

  _createButton(BuildContext context) {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: Colors.deepPurple,
      child: Icon(Icons.arrow_forward_ios),
      onPressed: () {
        Navigator.pushNamed(context, 'product')
            .then((value) => setState(() {}));
      },
    );
  }
}
