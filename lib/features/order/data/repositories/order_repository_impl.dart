// import 'package:gcpro/features/order/data/datasource/order_datasource.dart';
// import 'package:gcpro/shared/domain/models/either.dart';
// import 'package:gcpro/shared/domain/models/paginated_response.dart';
// import 'package:gcpro/shared/exceptions/http_exception.dart';

// abstract class OrderRepository {
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   });
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   });
// }

// class OrderRepositoryImpl extends OrderRepository {
//   OrderRepositoryImpl(this.orderDatasource);
//   final OrderDatasource orderDatasource;

//   @override
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   }) {
//     return orderDatasource.fetchPaginatedData(skip: skip);
//   }

//   @override
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   }) {
//     return orderDatasource.searchPaginatedData(
//       skip: skip,
//       query: query,
//     );
//   }
// }
