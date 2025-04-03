import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/product_repository_interface.dart';
import '../datasources/local_product_data_source.dart';

class ProductRepositoryImplementation implements ProductRepository {
  final LocalProductDataSource localDataSource;

  ProductRepositoryImplementation(this.localDataSource);

  @override
  Future<Product> getProductById(int id) async {
    final model = await localDataSource.getProductById(id);
    return model.toEntity();
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final models = await localDataSource.getAllProducts();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Product>> getProductsBySeller(int sellerId) {
    // TODO: implement getProductsBySeller
    throw UnimplementedError();
  }
}
