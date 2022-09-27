import 'package:shopping_app/services/productservice.dart';
import 'package:http/http.dart' as http;

import '../model/Product.dart';

class ProductRepository {
  ProductService productService = ProductService(client: http.Client());

  Future<List<Product>> getProducts() async {
    List<dynamic> products = await productService.getAll();
    List<Product> productList =
        products.map((product) => Product.fromJson(product)).toList();
    return productList;
  }
}
