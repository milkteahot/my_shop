import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:skying/utils/Global.dart';

class ServerApi {
  static Future<void> registerCustomer (String email, String name, String address, String password) async {
    return await requestPost(
      '/api/customers',
      {
        'values' : json.encode({
          'email': email,
          'name' : name,
          'address': address,
          'password': password,
        })
      }
    );
  }

  static Future<http.Response> requestPost (String path, Map<String, String> body) async {
    final res = await http.post(
      Global.server_address + path,
      body: body,
    );
    return _request_tail(res);
  }

  static http.Response _request_tail (http.Response res) {
    if (res.statusCode ~/100 == 2) {
      return res;
    }

    throw ServerApiException(res);
  }
}

class ServerApiException implements Exception {
  http.Response response;
  ServerApiException (this.response);
}