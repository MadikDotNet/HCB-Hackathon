import 'package:flutter/foundation.dart';
import 'package:hj_banking_mobile/auth/models/token_response.dart';
import 'package:hj_banking_mobile/common/api/api_client.dart';
import 'package:hj_banking_mobile/common/api/index.dart';
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
