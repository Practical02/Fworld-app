import 'package:function_world_app/models/post_list_model.dart';
import 'package:function_world_app/services/consumer_service.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  var postList = List<PostModel>.empty().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    getFavourites(); // Fetch initial data
    super.onInit();
  }

  Future<void> getFavourites() async {
    try {
      isLoading(true); // Set loading to true before fetching data
      var posts = await ConsumerService.fetchFavourites();
      if (posts != null) {
        postList(posts);
      } else {
        Get.snackbar("", "Something went wrong");
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false); // Set loading to false after fetching data
    }
  }
}
