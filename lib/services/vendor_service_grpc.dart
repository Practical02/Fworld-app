import 'dart:async';
import 'dart:typed_data';

import 'package:function_world_app/src/generated/vendor.pb.dart';
import 'package:function_world_app/src/generated/vendor.pbgrpc.dart';
import 'package:get/get.dart';
import 'package:grpc/grpc.dart';

class VendorService {

    static FutureOr<VendorAuthResponse?> register(String name, String email, String password) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = VendorClient(channel);
    try {
      var resp = await stub.register(VendorRegisterRequest(name: name, email: email, password: password));
      return resp;
    } on GrpcError catch(e) {
      print(e);
      switch(e.code) {

        case 6:
          Get.snackbar("Authorization Error", "Email already exists");
          break;

        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;
      } 
      return null;
    } catch(e) {
        print(e);
        Get.snackbar("App Error", "Something went wrong");
        return null;
    }
  }

  static FutureOr<VendorAuthResponse?> login(String email, String password) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = VendorClient(channel);
    try {
      var resp = await stub.login(VendorLoginRequest(email: email, password: password));
      return resp;
    } on GrpcError catch(e) {
      switch(e.code) {

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
    } catch(e) {
        print(e);
        Get.snackbar("App Error", "Something went wrong");
        return null;
    }
  }

  static FutureOr<VendorVerifyEmailResponse?> verifyEmail(String token, int otp) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = VendorClient(channel);
    try {
      var resp = await stub.verifyEmail(VendorVerifyEmailRequest(token: token, otp: otp));
      return resp;
    } on GrpcError catch(e) {
      switch(e.code) {

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
    } catch(e) {
        Get.snackbar("App Error", "Something went wrong");
        return null;
    }
  }

  static FutureOr<UpdateDetailsResponse?> updateDetails(String token, String name, String phone, String description, String services) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = VendorClient(channel);
    try {
      var resp = await stub.updateDetails(UpdateDetailsRequest(token: token, name: name, phone: phone, description: description, services: services));
      return resp;
    } on GrpcError catch(e) {
      switch(e.code) {

        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      } 
      return null;
    } catch(e) {
        Get.snackbar("App Error", "Something went wrong");
        return null;
    }
  }

  static FutureOr<UpdateDetailsResponse?> updateSocials(String token, Uint8List image, String filename, String instagram, String facebook) async {
    final channel = ClientChannel(
      'roundhouse.proxy.rlwy.net',
      port: 53090,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = VendorClient(channel);
    try {
      var resp = await stub.updateSocials(UpdateSocialsRequest(token: token, image: image, filename: filename, instagram: instagram, facebook: facebook));
      return resp;
    } on GrpcError catch(e) {
      switch(e.code) {

        case 13:
          Get.snackbar("Server Error", "Something went wrong");
          break;

        default:
          Get.snackbar("Error", e.toString());
      } 
      return null;
    } catch(e) {
        Get.snackbar("App Error", "Something went wrong");
        return null;
    }
  }

}