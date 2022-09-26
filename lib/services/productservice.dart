import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductService {
  final String url =
      'https://e-commerce-microfrontends-apis.herokuapp.com/products';
  final http.Client client;

  ProductService({required this.client});

  Future<dynamic> getAll() async {
    http.Response response = await client.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
