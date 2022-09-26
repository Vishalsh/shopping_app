import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping_app/services/ProductService.dart';
import 'package:http/http.dart' as http;
import 'ProductService_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('product service', () {
    test('should call http with specified url to get products', () async {
      final mockClient = MockClient();
      var productService = ProductService(client: mockClient);
      when(mockClient.get(Uri.parse(
              'https://e-commerce-microfrontends-apis.herokuapp.com/products')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      await productService.getAll();
      verify(mockClient.get(Uri.parse(
          'https://e-commerce-microfrontends-apis.herokuapp.com/products')));
    });

    test('should return products json', () async {
      final mockClient = MockClient();
      var productService = ProductService(client: mockClient);
      when(mockClient.get(Uri.parse(
              'https://e-commerce-microfrontends-apis.herokuapp.com/products')))
          .thenAnswer((_) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      var products = await productService.getAll();
      expect(products, {"userId": 1, "id": 2, "title": "mock"});
    });
  });
}
