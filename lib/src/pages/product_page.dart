import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);

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
            child: Column(
          children: [
            _createName(),
            _createPrice(),
            _createButton(),
          ],
        )),
      )),
    );
  }

  Widget _createName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Product'),
    );
  }

  Widget _createPrice() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(labelText: 'Price'),
    );
  }

  Widget _createButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Container(
        //width: 30.0,
        //height: 10.0,
        child: Row(
          children: [
            Text('Save'),
            Icon(Icons.save),
          ],
        ),
      ),
    );
  }
}
