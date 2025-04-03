// import 'package:gcpro/features/chat/data/datasource/chat_datasource.dart';
// import 'package:gcpro/shared/domain/models/either.dart';
// import 'package:gcpro/shared/domain/models/paginated_response.dart';
// import 'package:gcpro/shared/exceptions/http_exception.dart';

// abstract class ChatRepository {
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   });
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   });
// }

// class ChatRepositoryImpl extends ChatRepository {
//   ChatRepositoryImpl(this.chatDatasource);
//   final ChatDatasource chatDatasource;

//   @override
//   Future<Either<AppException, PaginatedResponse>> fetchData({
//     required int skip,
//   }) {
//     return chatDatasource.fetchPaginatedData(skip: skip);
//   }

//   @override
//   Future<Either<AppException, PaginatedResponse>> searchData({
//     required int skip,
//     required String query,
//   }) {
//     return chatDatasource.searchPaginatedData(
//       skip: skip,
//       query: query,
//     );
//   }
// }
