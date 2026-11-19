import 'package:equatable/equatable.dart';
import 'package:storeapp/features/products/domain/entities/rating.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];
}
