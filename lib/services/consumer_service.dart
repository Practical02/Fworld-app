import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/api_routes.dart';
import 'package:function_world_app/models/post_list_model.dart';
import 'package:function_world_app/models/vendor_model.dart';
import 'package:http/http.dart' as http;

class ConsumerService {

  static Future<List<PostModel>?> FetchPosts(int page) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_CONSUMER_JWT_TOKEN');
    print(jwt);
    final url = "${ApiRoutes.consumerFeedRoute}$page";
    print(url);
    var resp = await http.get(
      Uri.parse(url),
      headers: Map.from(<String,String>{
        'content-type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }),
    );

    if(resp.statusCode == 200) {
      var posts = feedModelFromJson(resp.body).data;
      print(posts);
      return posts;
    } else {
      print(resp.body);
      return null;
    }
  }

  static Future<List<PostModel>?> fetchFavourites() async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_CONSUMER_JWT_TOKEN');
    final url = ApiRoutes.consumerFavouriteVendorRoute;
    var resp = await http.get(
      Uri.parse(url),
      headers: Map.from(<String,String>{
        'content-type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }),
    );

    if(resp.statusCode == 200) {
      var posts = feedModelFromJson(resp.body).data;
      return posts;
    } else {
      return null;
    }
  }

    static Future<VendorModel?> fetchVendor(String vendorID) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_CONSUMER_JWT_TOKEN');
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

  

  static Future<bool> followVendor(String vendorID) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_CONSUMER_JWT_TOKEN');
    final url = ApiRoutes.consumerFollowVendorRoute;
    var resp = await http.post(
      Uri.parse(url),
      headers: Map.from(<String,String>{
        'content-type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }),
      body: json.encode(<String,String>{"vendor_id": vendorID})
    );

    if(resp.statusCode == 200) {
      return true;
    } else {
      print(resp.body);
      return false;
    }
  }

    static Future<bool> likeVendor(String vendorID) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_CONSUMER_JWT_TOKEN');
    final url = ApiRoutes.consumerLikeVendorRoute;
    var resp = await http.post(
      Uri.parse(url),
      headers: Map.from(<String,String>{
        'content-type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }),
      body: json.encode(<String,String>{"vendor_id": vendorID})
    );

    if(resp.statusCode == 200) {
      return true;
    } else {
      print(resp.body);
      return false;
    }
  }

    static Future<bool> favouriteVendor(String vendorID) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_CONSUMER_JWT_TOKEN');
    final url = ApiRoutes.consumerFavouriteVendorRoute;
    var resp = await http.post(
      Uri.parse(url),
      headers: Map.from(<String,String>{
        'content-type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }),
      body: json.encode(<String,String>{"vendor_id": vendorID})
    );

    if(resp.statusCode == 200) {
      return true;
    } else {
      print(resp.body);
      return false;
    }
  }

  static Future<bool> verifyOTP(int otp) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_CONSUMER_JWT_TOKEN');
    var resp = await http.post(
      Uri.parse(ApiRoutes.consumerVerifyMailRoute),
      headers: Map.from(<String,String>{
        'content-type': 'application/json',
        'Authorization': 'Bearer $jwt'
      }),
      body: json.encode(<String,int>{"otp": otp})
    );

    if(resp.statusCode == 200) {
      return true;
    } else {
      print(resp.body);
      return false;
    }
  }
}