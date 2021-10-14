import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hj_banking_mobile/auth/data/providers/token_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: TokenStorage, env: [Environment.prod])
class SecureTokenStorage implements TokenStorage {
  final FlutterSecureStorage _storage;

  SecureTokenStorage({
    required FlutterSecureStorage storage,
  }) : this._storage = storage;

  Future<void> setToken(String token) async {
    await _storage.write(key: 'access_token', value: token);
  }

  Future<void> clearToken() async {
    await _storage.delete(key: 'access_token');
  }

  Future<String> getToken() async {
    var token = await _storage.read(key: 'access_token');
    return token!;
  }

  Future<bool> hasToken() async {
    return await _storage.containsKey(key: 'access_token');
  }
}
