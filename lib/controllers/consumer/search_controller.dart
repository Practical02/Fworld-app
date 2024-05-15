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


  Future<void> search() async {
      isLoading(true);
        var searchResp = await ConsumerService.search(searchController.text);
        if(searchResp != null) {
          responses.value = searchResp;
          isLoading(false);
        }
      }
}
