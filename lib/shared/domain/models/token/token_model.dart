import 'package:equatable/equatable.dart';

class Token extends Equatable {
  const Token({
    this.accessToken = '',
    this.refreshToken = '',
  });

  factory Token.fromJson(Map<String, dynamic> map) => Token(
        accessToken: map['accessToken'].toString(),
        refreshToken: map['refreshToken'].toString(),
      );
  final String accessToken;
  final String refreshToken;

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];

  @override
  String toString() => 'Token(accessToken: $accessToken, refreshToken: $refreshToken)';

  bool get isEmpty => accessToken.isEmpty || refreshToken.isEmpty;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  Token copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return Token(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
