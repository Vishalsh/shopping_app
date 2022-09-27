import 'ProductRating.dart';

class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  ProductRating rating;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      required this.rating});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      title: json['title'] as String,
      price: json['price'] as double,
      description: json['description'] as String,
      category: json['category'] as String,
      image: json['category'] as String,
      rating: ProductRating.fromJson(json['rating']),
    );
  }
}
