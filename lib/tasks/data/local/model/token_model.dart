import 'dart:convert';
import 'dart:math';

class Token {
  final String token;

  Token(this.token);

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(json['token']);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }

  static Token generateDynamicToken() {
    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final random = Random.secure().nextInt(999999).toString();
    final rawToken = 'token_${timestamp}_$random';
    final bytes = utf8.encode(rawToken);

    return Token(base64.encode(bytes));
  }

  @override
  String toString() {
    return 'Token(token: $token)';
  }
}
