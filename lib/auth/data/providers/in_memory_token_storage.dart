import 'package:hj_banking_mobile/auth/data/providers/token_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenStorage, env: [Environment.dev, Environment.test])
class InMemoryTokenStorage implements TokenStorage {
  String? _token;

  Future<void> setToken(String token) async {
    this._token = token;
  }

  Future<void> clearToken() async {
    this._token = null;
  }

  Future<String> getToken() async {
    return this._token!;
  }

  Future<bool> hasToken() async {
    return this._token != null;
  }
}
