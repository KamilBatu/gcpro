import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';

import '../models/product_model.dart';
import './dummydata.dart';

class LocalProductDataSource {
  // Static list of products for development
  final _products = productsMockData;
  final _categories = categories;

  Future<ProductModel> getProductById(int id) async {
    final product = _products.firstWhere(
      (product) => product.id == id,
      orElse: () => throw Exception('Product not found'),
    );
    return product;
  }

  Future<List<ProductModel>> getAllProducts() async {
    return _products;
  }

  Future<List<Category>> getAllCategory() async {
    return _categories;
  }
}
