import 'dart:convert';
import 'dart:io';
import 'package:login/src/user_preferences/user_prefs.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:login/src/models/product_model.dart';

class ProductsProvider {
  final String _url = 'login-f7c91-default-rtdb.firebaseio.com';
  final _prefs = new UserPreferences();

  Future<bool> createProduct(ProductModel product) async {
    final url = Uri.https(_url, 'products.json', {'auth': '${_prefs.token}'});
    final resp = await http.post(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);
    print(decodedData);

    return true;
  }

  Future<bool> editProduct(ProductModel product) async {
    final url = Uri.https(
        _url, 'products/${product.id}.json', {'auth': '${_prefs.token}'});
    final resp = await http.put(url, body: productModelToJson(product));

    final decodedData = json.decode(resp.body);
    print(decodedData);

    return true;
  }

  Future<List<ProductModel>> loadProducts() async {
    final url = Uri.https(_url, 'products.json', {'auth': '${_prefs.token}'});
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
    final url =
        Uri.https(_url, 'products/$id.json', {'auth': '${_prefs.token}'});
    final resp = await http.delete(url);

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return 1;
  }

  Future<String> uploadImage(File img) async {
    final url = Uri.parse(
        "https://api.cloudinary.com/v1_1/dwhd7wpsu/image/upload?upload_preset=doxxxo3z");

    final mimeType = mime(img.path).split('/');

    final imgUploadRequest = http.MultipartRequest(
      'POST',
      url,
    );

    final file = await http.MultipartFile.fromPath(
      'file',
      img.path,
      contentType: MediaType(mimeType[0], mimeType[1]),
    );

    imgUploadRequest.files.add(file);

    final streamResponse = await imgUploadRequest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode != 201) {
      return null;
    }

    final respData = json.decode(resp.body);
    return respData['secure_url'];
  }
}
