import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/domain/repositories/product_repository_interface.dart';

class FetchSellerProducts {
  final ProductRepository repository;

  FetchSellerProducts(this.repository);

  Future<List<Product>> call(int sellerId) async {
    return await repository.getProductsBySeller(sellerId);
  }
}
