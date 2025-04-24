import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';

class ProductModel {
  final int id;
  final String name;
  final double price;
  final String description;
  final double rating;
  final String imageUrl;
  final Category category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
    required this.imageUrl,
    required this.category,
  });

  Product toEntity() => Product(
        id: id,
        name: name,
        price: price,
        description: description,
        rating: rating,
        imageUrl: imageUrl,
        category: category,
      );
}
