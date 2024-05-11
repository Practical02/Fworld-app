

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/api_routes.dart';
import 'package:function_world_app/models/error_model.dart';
import 'package:function_world_app/models/vendor_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class VendorService {

    static Future<bool> verifyOTP(int otp) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_VENDOR_JWT_TOKEN');
    var resp = await http.post(
      Uri.parse(ApiRoutes.vendorVerifyMailRoute),
      headers: Map.from(<String,String>{
        'content-type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }),
      body: json.encode(<String,int>{"otp": otp})
    );

    if(resp.statusCode == 200) {
      return true;
    } else {
      var error = errorModelFromJson(resp.body);
      Get.snackbar("Authentication Problem", error.error);
      return false;
    }
  }

  static Future<VendorModel?> fetchVendor(String vendorID) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_VENDOR_JWT_TOKEN');
    final url = "${ApiRoutes.consumerVendorRoute}$vendorID";
    var resp = await http.get(
      Uri.parse(url),
      headers: Map.from(<String,String>{
        'content-type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }),
    );

    if(resp.statusCode == 200) {
      var vendor = vendorModelFromJson(resp.body);
      return vendor;
    } else {
      print(resp.body);
      return null;
    }
  }
}