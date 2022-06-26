import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:online_food_app/src/utility/BaseURL.dart';

class AuthProvider {
  Client client = Client();

  Future<dynamic> getValidateEmail(String email) async {
    var uri = Uri.parse(BaseURL.urlGetValidateEmail);

    uri = uri.replace(queryParameters: <String, String>{
      'email': email,
    });

    final res = await client.get(uri, headers: {
      'Accept': 'application/json',
    });

    return jsonDecode(res.body);
  }

  Future<dynamic> login(String email, String password) async {
    final res = await client.post(BaseURL.urlLogin, headers: {
      'Accept': 'application/json',
    }, body: {
      'email': email,
      'password': password,
    });

    return jsonDecode(res.body);
  }

  Future<dynamic> register(
      String nama, String no_tlp, String email, String password) async {
    final res = await client.post(BaseURL.urlRegister,
     headers: {
      'Accept': 'application/json',
    }, body: {
      'nama': nama,
      'no_tlp': no_tlp,
      'email': email,
      'password': password,
    });

    return jsonDecode(res.body);
  }

  Future<dynamic> simpanPassword(String id, String password) async {
    final res = await client.post(BaseURL.urlSimpanPassword,
     headers: {
      'Accept': 'application/json',
    }, body: {
      'id' : id,
      'password': password,
    });

    return jsonDecode(res.body);
  }

}
