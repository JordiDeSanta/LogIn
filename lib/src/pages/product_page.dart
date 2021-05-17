import 'package:flutter/material.dart';
import 'package:login/src/utils/utils.dart' as utils;

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final formKey = GlobalKey<FormState>();

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
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product',
      ),
      validator: (v) {
        return (v.length < 3) ? 'Enter the name of the product' : null;
      },
    );
  }

  Widget _createPrice() {
    return TextFormField(
      keyboardType: TextInputType.number,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Price',
      ),
      validator: (v) {
        if (utils.isNumeric(v)) {
          return null;
        } else {
          return 'Just numbers please';
        }
      },
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
    print('xd');
  }
}
