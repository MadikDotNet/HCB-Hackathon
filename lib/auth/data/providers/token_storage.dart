abstract class TokenStorage {
  Future<void> setToken(String token);

  Future<void> clearToken();

  Future<String> getToken();

  Future<bool> hasToken();
}
