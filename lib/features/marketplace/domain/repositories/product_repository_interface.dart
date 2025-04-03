import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Product> getProductById(int id);
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductsBySeller(int sellerId);
}
