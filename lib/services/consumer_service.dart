import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/api_routes.dart';
import 'package:function_world_app/models/post_list_model.dart';
import 'package:http/http.dart' as http;

class ConsumerService {

  static Future<List<PostModel>?> FetchPosts(int page) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_JWT_TOKEN');
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

  static Future<bool> verifyOTP(int otp) async {
    final storage = const FlutterSecureStorage();
    final jwt = await storage.read(key: 'FWORLD_JWT_TOKEN');
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