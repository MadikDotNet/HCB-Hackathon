import 'package:flutter/foundation.dart';
import 'package:hcb_hackathon/auth/models/token_response.dart';
import 'package:hcb_hackathon/common/api/api_client.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthApi {
  final ApiClient _client;

  AuthApi({
    required ApiClient client,
  }) : _client = client.route('auth');

  Future<TokenResponse> token(String login, String password) async {
    final response = await _client.post('token', {
      'login': login,
      'password': password,
    });

    return compute(
      TokenResponse.compute,
      response.body,
    );
  }
}
