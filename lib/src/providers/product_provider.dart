import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:login/src/models/product_model.dart';

class ProductsProvider {
  final String _url = 'login-f7c91-default-rtdb.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    final url = Uri.https(_url, 'products.json');
    final resp = await http.post(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;
  }
}
