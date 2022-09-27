class ProductRating {
  double rate;
  int count;

  ProductRating({required this.rate, required this.count});

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return ProductRating(
        rate: json['rate'] as double, count: json['count'] as int);
  }
}
