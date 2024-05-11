import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:function_world_app/models/post_list_model.dart';
import 'package:function_world_app/services/consumer_service_grpc.dart';
import 'package:function_world_app/src/generated/consumer.pb.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  var feed = FeedResponse().obs;
  var isLoading = false.obs;
  final storage = FlutterSecureStorage();

  @override
  void onInit() {
    getFeed(); // Fetch initial data
    super.onInit();
  }

  Future<void> getFeed() async {
      isLoading(true);
      final token = await storage.read(key: "FWORLD_CONSUMER_TOKEN"); 
      if(token != null) {
        var feedResp = await ConsumerService.getFeed(token);
        if(feedResp != null) {
          feed.value = feedResp;
          isLoading(false);
        }
      } else {
        isLoading(false);
        Get.snackbar("", "Something went wrong");
        Get.toNamed(RoutesConstant.userLogin);
      }
  }

}
