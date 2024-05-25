import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/services/consumer_service_grpc.dart';
import 'package:function_world_app/src/generated/consumer.pb.dart';
import 'package:get/get.dart';

class VendorSearchController extends GetxController {
  SearchController searchController = SearchController();

  var responses = SearchResponse().obs;
  var isLoading = false.obs;

  Future<void> search(String query) async {
    try {
      isLoading(true);
      var searchResp = await ConsumerService.search(query);
      if (searchResp != null) {
        responses.value = searchResp;
      }
    } finally {
      isLoading(false);
    }
  }
}
