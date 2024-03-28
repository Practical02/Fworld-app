import 'package:function_world_app/models/post_list_model.dart';
import 'package:function_world_app/services/consumer_service.dart';
import 'package:get/get.dart';

class FeedController extends GetxController {
  var postList = List<PostModel>.empty().obs;
  var isLoading = false.obs;
  var currentPage = 1.obs; // Track current page

  @override
  void onInit() {
    getFeed(currentPage.value); // Fetch initial data
    super.onInit();
  }

  Future<void> getFeed(int page) async {
    try {
      isLoading(true); // Set loading to true before fetching data
      var posts = await ConsumerService.FetchPosts(page);
      if (posts != null) {
        if (page == 1) {
          // If it's the first page, replace the existing list
          postList.assignAll(posts);
        } else {
          // If it's not the first page, append to the existing list
          postList.addAll(posts);
        }
        currentPage.value = page; // Update current page
      } else {
        Get.snackbar("", "Something went wrong");
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading(false); // Set loading to false after fetching data
    }
  }

  // Function to load more data
  void loadMoreData() {
    if (!isLoading.value) {
      getFeed(currentPage.value + 1);
    }
  }
}
