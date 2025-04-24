import 'package:gcpro/features/marketplace/data/datasources/local_product_data_source.dart';
import 'package:gcpro/features/marketplace/data/repositories/product_repository_implementation.dart';
import 'package:gcpro/features/marketplace/domain/entities/product_entity.dart';
import 'package:gcpro/features/marketplace/domain/usecases/fetch_all_products_usecase.dart';
import 'package:gcpro/features/marketplace/domain/usecases/fetch_product_by_id_usecase.dart';
import 'package:gcpro/features/marketplace/domain/usecases/fetch_seller_products_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Providers for dependency injection (unchanged)
final localProductDataSourceProvider =
    Provider((ref) => LocalProductDataSource());
final productRepositoryProvider = Provider(
  (ref) => ProductRepositoryImplementation(
    ref.read(localProductDataSourceProvider),
  ),
);
final fetchProductByIdProvider = Provider(
  (ref) => FetchProductById(
    ref.read(productRepositoryProvider),
  ),
);
final fetchAllProductsProvider = Provider(
  (ref) => FetchAllProducts(
    ref.read(productRepositoryProvider),
  ),
);
final fetchSellerProductsProvider = Provider(
  (ref) => FetchSellerProducts(
    ref.read(productRepositoryProvider),
  ),
);

// Notifier for fetching a product by ID
class ProductByIdNotifier extends AutoDisposeFamilyAsyncNotifier<Product, int> {
  @override
  Future<Product> build(int id) async {
    final fetchProductById = ref.read(fetchProductByIdProvider);
    return fetchProductById(id);
  }
}

final productByIdProvider =
    AsyncNotifierProvider.autoDispose.family<ProductByIdNotifier, Product, int>(
  ProductByIdNotifier.new,
);

// Notifier for fetching all products
class AllProductsNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    final fetchAllProducts = ref.read(fetchAllProductsProvider);
    return fetchAllProducts();
  }
}

final allProductsProvider =
    AsyncNotifierProvider<AllProductsNotifier, List<Product>>(
  AllProductsNotifier.new,
);

// Notifier for fetching seller products
class SellerProductsNotifier
    extends AutoDisposeFamilyAsyncNotifier<List<Product>, int> {
  @override
  Future<List<Product>> build(int sellerId) async {
    final fetchSellerProducts = ref.read(fetchSellerProductsProvider);
    return fetchSellerProducts(sellerId);
  }
}

final sellerProductsProvider = AsyncNotifierProvider.autoDispose
    .family<SellerProductsNotifier, List<Product>, int>(
  SellerProductsNotifier.new,
);
