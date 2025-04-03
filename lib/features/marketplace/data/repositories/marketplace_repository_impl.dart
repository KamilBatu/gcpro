// import 'package:gcpro/features/marketplace/data/datasource/marketplace_datasource.dart';
// import 'package:gcpro/shared/domain/models/either.dart';
// import 'package:gcpro/shared/domain/models/paginated_response.dart';
// import 'package:gcpro/shared/exceptions/http_exception.dart';

// abstract class MarketplaceRepository {
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   });
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   });
// }

// class MarketplaceRepositoryImpl extends MarketplaceRepository {
//   MarketplaceRepositoryImpl(this.marketplaceDatasource);
//   final MarketplaceDatasource marketplaceDatasource;

//   @override
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   }) {
//     return marketplaceDatasource.fetchPaginatedData(skip: skip);
//   }

//   @override
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   }) {
//     return marketplaceDatasource.searchPaginatedData(
//       skip: skip,
//       query: query,
//     );
//   }
// }
