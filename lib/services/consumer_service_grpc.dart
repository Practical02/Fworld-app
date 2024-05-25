import 'dart:async';
import 'dart:typed_data';

import 'package:function_world_app/src/generated/consumer.pb.dart';
import 'package:function_world_app/src/generated/consumer.pbgrpc.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

class ConsumerService {
  static FutureOr<AuthResponse?> register(
      String name, String email, String password) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp = await stub.register(
          RegisterRequest(name: name, email: email, password: password));
      return resp;
    } on GrpcError catch (e) {
      print(e);
      switch (e.code) {
        case 6:
          Get.snackbar("Authorization Error", "Email already exists");
          break;

        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;
      }
      return null;
    } catch (e) {
      print(e);
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<AuthResponse?> login(String email, String password) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp =
          await stub.login(LoginRequest(email: email, password: password));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 6:
          Get.snackbar("Authorization Error", "Email already exists");
          break;

        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      print(e);
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<VerifyEmailResponse?> verifyEmail(
      String token, int otp) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp =
          await stub.verifyEmail(VerifyEmailRequest(token: token, otp: otp));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 7:
          Get.snackbar("Invalid OTP", "Enter correct OTP");
          break;

        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<UpdateProfileResponse?> updateProfile(
      String token, String name, String phone) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp = await stub.updateProfile(
          UpdateProfileRequest(token: token, name: name, phone: phone));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<UploadResponse?> updateProfilePic(
      String token, String filename, Uint8List data) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp = await stub.updateProfilePic(
          UploadRequest(token: token, filename: filename, data: data));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<ProfileResponse?> getProfile(String token) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp = await stub.profile(ProfileRequest(token: token));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<SearchResponse?> search(String query) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp = await stub.search(SearchRequest(query: query));
      print(resp);
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<FeedResponse?> getFeed(String token) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp = await stub.feed(FeedRequest(token: token));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<FeedResponse?> getFavourites(String token) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp = await stub.favourites(FeedRequest(token: token));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<VendorResponse?> getVendor(
      String token, String vendorID) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp =
          await stub.vendor(VendorRequest(token: token, vendorID: vendorID));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<FLFResponse?> follow(String token, String vendorID) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp =
          await stub.follow(FLFRequest(token: token, vendorID: vendorID));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<FLFResponse?> like(String token, String vendorID) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp = await stub.like(FLFRequest(token: token, vendorID: vendorID));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }

  static FutureOr<FLFResponse?> favourite(String token, String vendorID) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = ConsumerClient(channel);
    try {
      var resp =
          await stub.favourite(FLFRequest(token: token, vendorID: vendorID));
      return resp;
    } on GrpcError catch (e) {
      switch (e.code) {
        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      }
      return null;
    } catch (e) {
      Get.snackbar("App Error", "Something went wrong");
      return null;
    }
  }
}
