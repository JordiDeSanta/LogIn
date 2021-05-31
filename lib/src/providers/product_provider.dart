import 'package:http/http.dart' as http;
import 'package:login/src/models/product_model.dart';

class ProductsProvider {
  final String _url = 'https://login-f7c91-default-rtdb.firebaseio.com';

  Future<bool> createProduct(ProductModel product) async {
    Uri url = Uri(path: '$_url/Product');

    final resp = await http.post(url, body: productModelToJson(product));
  }
}
