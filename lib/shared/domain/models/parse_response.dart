// To parse this JSON data, do
//
//     final parseResponse = parseResponseFromMap(jsonString);

class ParseResponse<T> {
  ParseResponse({
    this.status,
    this.message,
    this.data,
    this.success = false,
  });
  factory ParseResponse.fromMap(
    Map<String, dynamic> json, {
    required T Function(dynamic) modifier,
  }) {
    return ParseResponse<T>(
      success: json['status'] == 'success',
      status: json['status'].toString(),
      message: json['message'].toString(),
      data: modifier(json),
    );
  }
  final bool success;
  final String? status;
  final String? message;
  final T? data;
}
