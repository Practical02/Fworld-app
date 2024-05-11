import 'dart:convert';

import 'package:function_world_app/constants/api_routes.dart';
import 'package:function_world_app/models/auth_model.dart';
import 'package:function_world_app/models/error_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AuthService {

  static Future<AuthModel?> registerUser(String name, String email, String password) async {
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
      var error = errorModelFromJson(resp.body);
      Get.snackbar("Existing Email", error.error);
      return null;
    }
  }

    static Future<AuthModel?> loginUser(String email, String password) async {
    print(email.isEmpty);
    print(password.isEmpty);
    var resp = await http.post(
      Uri.parse(ApiRoutes.consumerLoginRoute),
      headers: Map.from(<String,String>{'content-type': 'application/json'}),
      body: json.encode(<String,String>{"email": email, "password": password})
    );

    if(resp.statusCode == 200) {
      var auth = authModelFromJson(resp.body);
      return auth;
    } else {
      var error = errorModelFromJson(resp.body);
      Get.snackbar("Authentication Problem", error.error);
      return null;
    }
  }

  static Future<AuthModel?> registerVendor(String name, String email, String password) async {
    var resp = await http.post(
      Uri.parse(ApiRoutes.vendorRegisterRoute),
      headers: Map.from(<String,String>{'content-type': 'application/json'}),
      body: json.encode(<String,String>{"name": name, "email": email, "password": password})
    );

    if(resp.statusCode == 200) {
      var auth = authModelFromJson(resp.body);
      return auth;
    } else {
      var error = errorModelFromJson(resp.body);
      Get.snackbar("Existing Email", error.error);
      return null;
    }
  }
}

