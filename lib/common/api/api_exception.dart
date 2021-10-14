class ApiException implements Exception {
  int errorCode;

  ApiException({
    required this.errorCode,
  });

  bool mustSignOut() => errorCode == 401;
}
