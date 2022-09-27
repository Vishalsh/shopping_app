import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_app/model/Product.dart';
import 'package:shopping_app/model/ProductRating.dart';
import 'package:shopping_app/repository/productrepository.dart';
import 'package:shopping_app/services/ProductService.dart';

import 'ProductRepository_test.mocks.dart';

@GenerateMocks([ProductService])
void main() {
  test('should return products json', () async {
    Future<List<dynamic>> products = Future(() {
      return [
        {
          "id": 1,
          "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          "price": 109.95,
          "description":
              "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          "category": "men's clothing",
          "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          "rating": {"rate": 3.9, "count": 120}
        }
      ];
    });
    var mockProductService = MockProductService();
    when(mockProductService.getAll()).thenAnswer((_) => products);
    var productRepository = ProductRepository();
    List<Product> actualProducts = await productRepository.getProducts();
    expect(
      actualProducts,
      [
        Product(
          id: 1,
          title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
          price: 109.95,
          description:
              "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
          category: "men's clothing",
          image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
          rating: ProductRating(
            rate: 3.9,
            count: 120,
          ),
        )
      ],
    );
  });
}
