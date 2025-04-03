const int PER_PAGE_LIMIT = 20;

class PaginatedResponse<T> {
  PaginatedResponse({
    required this.total,
    required this.skip,
    required this.data,
  });

  factory PaginatedResponse.fromJson(Map<String, int> json, List<T> data) => PaginatedResponse(
        total: json['total'] ?? 0,
        skip: json['skip'] ?? 0,
        data: data,
      );
  final int total;

  final int skip;

  static const limit = PER_PAGE_LIMIT;

  final List<T> data;
  @override
  String toString() {
    return 'PaginatedResponse(total:$total, skip:$skip, data:${data.length})';
  }
}
