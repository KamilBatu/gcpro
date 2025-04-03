import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/domain/repositories/product_repository_interface.dart';

class FetchAllProducts {
  final ProductRepository repository;

  FetchAllProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getAllProducts();
  }
}
