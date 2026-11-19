import 'package:storeapp/features/products/data/models/rating_model.dart';
import 'package:storeapp/features/products/domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final rating = json['rating'];
    return ProductModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      price: (json['price'] as num).toDouble(),
      description: (json['description'] as String?) ?? '',
      category: (json['category'] as String?) ?? '',
      image: (json['image'] as String?) ?? '',
      rating: rating is Map<String, dynamic> ? RatingModel.fromJson(rating) : null,
    );
  }
}
