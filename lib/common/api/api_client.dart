import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import 'api_invoker.dart';

@singleton
class ApiClient extends ApiInvoker {
  final bool _isRoot;

  String? _token;

  ApiClient()
      : this.root(
          kDebugMode
              ? 'https://10.0.2.2:5001/api/v1'
              : String.fromEnvironment('api_url'),
        );

  ApiClient.root(String url)
      : _isRoot = true,
        super(url: url, client: Client());

  ApiClient._route(String url, Client client)
      : _isRoot = false,
        super(url: url, client: client);

  ApiClient route(String route) {
    return ApiClient._route(url + route, client);
  }

  bool get hasToken => _token != null;

  void setToken(String token) {
    _token = token;
  }

  void clearToken() {
    _token = null;
  }

  @override
  Map<String, String> constructHeaders() {
    if (_token == null) {
      return super.constructHeaders();
    }

    return {
      ...super.constructHeaders(),
      'Authorization': 'Bearer $_token',
    };
  }

  @disposeMethod
  void close() {
    if (_isRoot) {
      client.close();
    }
  }
}
