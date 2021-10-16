import 'dart:convert';
import 'dart:io';

import 'package:hcb_hackathon/common/api/response_extensions.dart';
import 'package:http/http.dart';

import 'api_exception.dart';
import 'network_exception.dart';

class ApiInvoker {
  final String url;
  final Client client;

  ApiInvoker({
    required String url,
    required this.client,
  }) : this.url = url.endsWith('/') ? url : url + '/';

  Future<Response> get(String path) async {
    return await _invoke(
      client.get(
        _createUri(url, path),
        headers: constructHeaders(),
      ),
    );
  }

  Future<Response> post(String path, dynamic body) async {
    return await _invoke(client.post(
      _createUri(url, path),
      headers: constructHeaders(),
      body: jsonEncode(body),
    ));
  }

  Future<Response> _invoke(Future<Response> request) async {
    try {
      var response = await request;

      if (!response.isSuccess()) {
        throw ApiException(errorCode: response.statusCode);
      }

      return response;
    } on SocketException {
      throw const NetworkException();
    }
  }

  Uri _createUri(String url, String path) {
    if (path.startsWith('/')) {
      return Uri.parse(url + path.substring(1));
    }

    return Uri.parse(url + path);
  }

  Map<String, String> constructHeaders() {
    return const {
      'accept': 'application/json',
      'content-type': 'application/json'
    };
  }
}
