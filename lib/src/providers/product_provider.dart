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

  Future<bool> editProduct(ProductModel product) async {
    final url = Uri.https(_url, 'products/${product.id}.json');
    final resp = await http.put(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);
    print(decodedData);

    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    final url = Uri.https(_url, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductModel> products = [];

    if (decodedData == null) return [];

    decodedData.forEach((id, product) {
      final prodTemp = ProductModel.fromJson(product);
      prodTemp.id = id;

      products.add(prodTemp);
    });

    return products;
  }

  Future<int> deleteProduct(String id) async {
    final url = Uri.https(_url, 'products/$id.json');
    final resp = await http.delete(url);

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return 1;
  }
}
