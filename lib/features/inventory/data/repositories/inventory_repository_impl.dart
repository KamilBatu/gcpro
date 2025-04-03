// import 'package:gcpro/features/inventory/data/datasource/inventory_datasource.dart';
// import 'package:gcpro/shared/domain/models/either.dart';
// import 'package:gcpro/shared/domain/models/paginated_response.dart';
// import 'package:gcpro/shared/exceptions/http_exception.dart';

// abstract class InventoryRepository {
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   });
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   });
// }

// class InventoryRepositoryImpl extends InventoryRepository {
//   InventoryRepositoryImpl(this.inventoryDatasource);
//   final InventoryDatasource inventoryDatasource;

//   @override
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   }) {
//     return inventoryDatasource.fetchPaginatedData(skip: skip);
//   }

//   @override
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   }) {
//     return inventoryDatasource.searchPaginatedData(
//       skip: skip,
//       query: query,
//     );
//   }
// }
