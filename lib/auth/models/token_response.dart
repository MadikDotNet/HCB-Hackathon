import 'dart:convert';

class TokenResponse {
  String accessToken;

  TokenResponse({
    required this.accessToken,
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      accessToken: json['accessToken'],
    );
  }

  static TokenResponse compute(String json) {
    return TokenResponse.fromJson(Map<String, dynamic>.from(jsonDecode(json),),);
  }
}
