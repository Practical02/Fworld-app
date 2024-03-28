import 'dart:convert';

import 'package:function_world_app/constants/api_routes.dart';
import 'package:function_world_app/models/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthService {

  static Future<AuthModel?> register(String name, String email, String password) async {
    print(name);
    print(email);
    print(password);
    var resp = await http.post(
      Uri.parse(ApiRoutes.consumerRegisterRoute),
      headers: Map.from(<String,String>{'content-type': 'application/json'}),
      body: json.encode(<String,String>{"name": name, "email": email, "password": password})
    );

    if(resp.statusCode == 200) {
      var auth = authModelFromJson(resp.body);
      return auth;
    } else {
      return null;
    }
  }
}