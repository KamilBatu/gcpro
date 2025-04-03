import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/domain/repositories/product_repository_interface.dart';

class FetchProductById {
  final ProductRepository repository;

  FetchProductById(this.repository);

  Future<Product> call(int id) async {
    return await repository.getProductById(id);
  }
}
