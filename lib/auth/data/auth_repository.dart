import 'package:hj_banking_mobile/auth/data/providers/auth_api.dart';
import 'package:hj_banking_mobile/auth/data/providers/token_storage.dart';
import 'package:hj_banking_mobile/common/api/api_client.dart';
import 'package:injectable/injectable.dart';

@singleton
class AuthRepository {
  final AuthApi client;
  final TokenStorage storage;
  final ApiClient api;

  AuthRepository({
    required this.client,
    required this.storage,
    required this.api,
  });

  Future<bool> init() async {
    if (await hasToken()) {
      api.setToken(await getToken());
      return true;
    }

    return false;
  }

  Future<String> authenticate({
    required String login,
    required String password,
  }) async {
    return (await client.token(login, password)).accessToken;
  }

  Future<bool> hasToken() async {
    return await storage.hasToken();
  }

  Future<String> getToken() async {
    return await storage.getToken();
  }

  Future<void> persistToken(String token) async {
    await storage.setToken(token);
    api.setToken(token);
  }

  Future<void> clearToken() async {
    await storage.clearToken();
    api.clearToken();
  }
}
