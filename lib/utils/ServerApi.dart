import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:skying/utils/Global.dart';

class ServerApi {
  static Future<void> login (String email, String password) async {
    final res = await requestPost('/api/login', //TODO: final res 로 저장하는 이유
      {
        'type' : 'CUSTOMER',
        'login_id' : email,
        'password' : password,
      }
    );
    return LoginResponse.fromJson(json.decode(res.body)['items'][0]);
  }

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

class LoginResponse {
  int id;
  String role;
  String token;

  LoginResponse (this.id, this.role, this.token);
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(json['id'], json['role'], json['token']);
  }
}