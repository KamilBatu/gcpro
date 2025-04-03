import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/local_product_data_source.dart';
import '../../data/repositories/product_repository_implementation.dart';
import '../../domain/usecases/fetch_product_by_id_usecase.dart';
import '../../domain/usecases/fetch_all_products_usecase.dart';
import '../../domain/usecases/fetch_seller_products_usecase.dart';
import '../../domain/entities/product_entity.dart';

// Providers for dependency injection
final localProductDataSourceProvider =
    Provider((ref) => LocalProductDataSource());
final productRepositoryProvider = Provider((ref) =>
    ProductRepositoryImplementation(ref.read(localProductDataSourceProvider)));
final fetchProductByIdProvider =
    Provider((ref) => FetchProductById(ref.read(productRepositoryProvider)));
final fetchAllProductsProvider =
    Provider((ref) => FetchAllProducts(ref.read(productRepositoryProvider)));
final fetchSellerProductsProvider =
    Provider((ref) => FetchSellerProducts(ref.read(productRepositoryProvider)));

// State providers for UI consumption
final productByIdProvider =
    FutureProvider.family<Product, int>((ref, id) async {
  final fetchProductById = ref.read(fetchProductByIdProvider);
  return await fetchProductById(id);
});

final allProductsProvider = FutureProvider<List<Product>>((ref) async {
  final fetchAllProducts = ref.read(fetchAllProductsProvider);
  return await fetchAllProducts();
});

final sellerProductsProvider =
    FutureProvider.family<List<Product>, int>((ref, sellerId) async {
  final fetchSellerProducts = ref.read(fetchSellerProductsProvider);
  return await fetchSellerProducts(sellerId);
});
