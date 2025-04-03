// import 'package:gcpro/features/dashboard/data/datasource/dashboard_datasource.dart';
// import 'package:gcpro/shared/domain/models/either.dart';
// import 'package:gcpro/shared/domain/models/paginated_response.dart';
// import 'package:gcpro/shared/exceptions/http_exception.dart';

// abstract class DashboardRepository {
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   });
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   });
// }

// class DashboardRepositoryImpl extends DashboardRepository {
//   DashboardRepositoryImpl(this.dashboardDatasource);
//   final DashboardDatasource dashboardDatasource;

//   @override
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   }) {
//     return dashboardDatasource.fetchPaginatedData(skip: skip);
//   }

//   @override
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   }) {
//     return dashboardDatasource.searchPaginatedData(
//       skip: skip,
//       query: query,
//     );
//   }
// }
