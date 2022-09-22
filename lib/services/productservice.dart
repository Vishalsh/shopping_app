import 'package:http/http.dart' as http;

class ProductService {
  final String url =
      'https://e-commerce-microfrontends-apis.herokuapp.com/products';
  final http.Client client;

  ProductService({required this.client});

  Future<dynamic> getAll() async {
    await client.get(Uri.parse(url));
  }
}
