class NetworkException implements Exception {
  const NetworkException();

  @override
  String toString() {
    return 'Network connection lost';
  }
}
