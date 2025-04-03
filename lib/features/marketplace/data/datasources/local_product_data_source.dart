import '../models/product_model.dart';
import './dummydata.dart';

class LocalProductDataSource {
  // Static list of products for development
  final _products = products;

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
}
