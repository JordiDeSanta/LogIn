import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/src/models/product_model.dart';
import 'package:login/src/providers/product_provider.dart';
import 'package:login/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProductModel product = new ProductModel();
  final productProvider = new ProductsProvider();

  bool bSaving = false;
  File photo;

  @override
  Widget build(BuildContext context) {
    final ProductModel prodData = ModalRoute.of(context).settings.arguments;
    if (prodData != null) {
      product = prodData;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: _selectPhoto,
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: _takePhoto,
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
                _showPhoto(),
                _createName(),
                _createPrice(),
                _createAvailable(),
                _saveButton(),
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

  Widget _saveButton() {
    return ElevatedButton.icon(
      onPressed: (bSaving) ? null : _submit,
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

    setState(() {
      bSaving = true;
    });

    if (product.id == null) {
      productProvider.createProduct(product);
    } else {
      productProvider.editProduct(product);
    }

    Navigator.pop(context);
  }

  void showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 1500),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  _showPhoto() {
    if (product.photoUrl != null) {
      return FadeInImage(
        placeholder: AssetImage('assets/jar-loading.gif'),
        image: NetworkImage(product.photoUrl),
        height: 300.0,
        fit: BoxFit.cover,
      );
    } else {
      return (photo == null)
          ? Image(
              image: AssetImage('assets/no-image.png'),
              height: 300,
              fit: BoxFit.cover,
            )
          : Image.file(
              photo,
              height: 300,
              fit: BoxFit.cover,
            );
    }
  }

  _selectPhoto() async {
    final _photo = await ImagePicker().getImage(source: ImageSource.gallery);
    photo = File(_photo.path);

    if (photo != null) {}

    setState(() {});
  }

  _takePhoto() async {
    final _photo = await ImagePicker().getImage(source: ImageSource.camera);
    photo = File(_photo.path);

    if (photo != null) {}

    setState(() {});
  }
}
