import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:storeapp/core/constants/api_constants.dart';
import 'package:storeapp/core/error/server_exception.dart';

class ApiClient {
  ApiClient({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  static const Map<String, String> _jsonHeaders = {
    'Content-Type': 'application/json',
  };

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    final response = await _client
        .get(Uri.parse(url), headers: headers)
        .timeout(ApiConstants.timeout);
    return _handle(response);
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    final response = await _client
        .post(Uri.parse(url), headers: _jsonHeaders, body: jsonEncode(body))
        .timeout(ApiConstants.timeout);
    return _handle(response);
  }

  dynamic _handle(http.Response response) {
    final ok = response.statusCode >= 200 && response.statusCode < 300;
    if (!ok) throw ServerException(response.statusCode);
    if (response.body.isEmpty) return null;
    return jsonDecode(response.body);
  }

  void close() => _client.close();
}
