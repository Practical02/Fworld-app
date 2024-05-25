import 'package:function_world_app/services/consumer_service_grpc.dart';
import 'package:get_storage/get_storage.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_world_app/constants/routes_constant.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final box = GetStorage();
  final storage = FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    GetStorage.init();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}

  registerConsumer(String name, String email, String password) async {
    var authResponse = await ConsumerService.register(name, email, password);
    if (authResponse != null) {
      storage.write(key: "FWORLD_CONSUMER_TOKEN", value: authResponse.token);
      box.write("email", email);
      Get.offAndToNamed(RoutesConstant.userEmailVerification);
    }
  }

  loginConsumer(String email, String password) async {
    var authResponse = await ConsumerService.login(email, password);
    if (authResponse != null) {
      storage.write(key: "FWORLD_CONSUMER_TOKEN", value: authResponse.token);
      box.write("email", email);
      storage.write(key: "email", value: email);
      storage.write(key: "isLoggedIn", value: "true");
      storage.write(key: "userType", value: "consumer");
      Get.offAllNamed(RoutesConstant.userNavigation);
    }
  }
}

// class AuthController extends GetxController {
//   AuthModel? auth_model;

//   var isLoading = false.obs;

//   final box = GetStorage();

//   @override
//   void onInit() {
//     super.onInit();
//     GetStorage.init();
//   }

//   @override
//   Future<void> onReady() async {
//     super.onReady();
//   }

//   @override
//   void onClose() {}

//   registerConsumer(String name, String email, String password) async {
//     try {
//       isLoading(false);
//       auth_model = await AuthService.registerUser(name, email, password);
//       final storage = new FlutterSecureStorage();
//       if (auth_model != null) {
//         storage.write(key: "FWORLD_CONSUMER_JWT_TOKEN", value: auth_model?.data);
//         Get.toNamed(RoutesConstant.userEmailVerification, arguments: email);
//       }
//     } on Exception catch (e) {
//       print('Error while getting data is $e');
//     } finally {
//       isLoading(false);
//     }
//   }

//   loginConsumer(String email, String password) async {
//     try {
//       isLoading(false);
//       auth_model = await AuthService.loginUser(email, password);
//       final storage = new FlutterSecureStorage();
//       if (auth_model != null) {
//         storage.write(key: "FWORLD_CONSUMER_JWT_TOKEN", value: auth_model?.data);
//         print(auth_model?.data);
//         box.write('email', email);
//         Get.offAllNamed(RoutesConstant.userNavigation);
//       }
//     } on Exception catch (e) {
//       print('Error while getting data is $e');
//     } finally {
//       isLoading(false);
//     }
//   }

// registerVendor(String name, String email, String password) async {
//     try {
//       isLoading(false);
//       auth_model = await AuthService.registerVendor(name, email, password);
//       final storage = new FlutterSecureStorage();
//       if (auth_model != null) {
//         storage.write(key: "FWORLD_VENDOR_JWT_TOKEN", value: auth_model?.data);
//         Get.toNamed(RoutesConstant.vendorEmailVerification, arguments: email);
//       }
//     } on Exception catch (e) {
//       print('Error while getting data is $e');
//     } finally {
//       isLoading(false);
//     }
//   }
// }
