import 'package:flutter/material.dart';
import 'package:login/src/models/product_model.dart';
import 'package:login/src/providers/product_provider.dart';
import 'package:login/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();

  ProductModel product = new ProductModel();
  final productProvider = new ProductsProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _createName(),
                _createPrice(),
                _createAvailable(),
                _createButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product',
      ),
      onSaved: (v) => product.title = v,
      validator: (v) {
        return (v.length < 3) ? 'Enter the name of the product' : null;
      },
    );
  }

  Widget _createPrice() {
    return TextFormField(
      initialValue: product.value.toString(),
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Price',
      ),
      onSaved: (v) => product.value = double.parse(v),
      validator: (v) {
        if (utils.isNumeric(v)) {
          return null;
        } else {
          return 'Just numbers please';
        }
      },
    );
  }

  Widget _createAvailable() {
    return SwitchListTile(
      activeColor: Colors.deepPurple,
      title: Text('Available?'),
      value: product.available,
      onChanged: (b) => setState(() {
        product.available = b;
      }),
    );
  }

  Widget _createButton() {
    return ElevatedButton.icon(
      onPressed: _submit,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0.0),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        )),
      ),
      icon: Icon(Icons.save),
      label: Text('Save', style: TextStyle(fontWeight: FontWeight.w300)),
    );
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    productProvider.createProduct(product);
  }
}
