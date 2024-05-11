//
//  Generated code. Do not modify.
//  source: consumer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'consumer.pb.dart' as $0;

export 'consumer.pb.dart';

@$pb.GrpcServiceName('Consumer')
class ConsumerClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.AuthResponse>(
      '/Consumer/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$0.RegisterRequest, $0.AuthResponse>(
      '/Consumer/Register',
      ($0.RegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$verifyEmail = $grpc.ClientMethod<$0.VerifyEmailRequest, $0.VerifyEmailResponse>(
      '/Consumer/VerifyEmail',
      ($0.VerifyEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VerifyEmailResponse.fromBuffer(value));
  static final _$updateProfile = $grpc.ClientMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
      '/Consumer/UpdateProfile',
      ($0.UpdateProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateProfileResponse.fromBuffer(value));
  static final _$updateProfilePic = $grpc.ClientMethod<$0.UploadRequest, $0.UploadResponse>(
      '/Consumer/UpdateProfilePic',
      ($0.UploadRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadResponse.fromBuffer(value));
  static final _$feed = $grpc.ClientMethod<$0.FeedRequest, $0.FeedResponse>(
      '/Consumer/Feed',
      ($0.FeedRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FeedResponse.fromBuffer(value));
  static final _$favourites = $grpc.ClientMethod<$0.FeedRequest, $0.FeedResponse>(
      '/Consumer/Favourites',
      ($0.FeedRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FeedResponse.fromBuffer(value));
  static final _$profile = $grpc.ClientMethod<$0.ProfileRequest, $0.ProfileResponse>(
      '/Consumer/Profile',
      ($0.ProfileRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ProfileResponse.fromBuffer(value));
  static final _$vendor = $grpc.ClientMethod<$0.VendorRequest, $0.VendorResponse>(
      '/Consumer/Vendor',
      ($0.VendorRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VendorResponse.fromBuffer(value));
  static final _$like = $grpc.ClientMethod<$0.FLFRequest, $0.FLFResponse>(
      '/Consumer/Like',
      ($0.FLFRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FLFResponse.fromBuffer(value));
  static final _$follow = $grpc.ClientMethod<$0.FLFRequest, $0.FLFResponse>(
      '/Consumer/Follow',
      ($0.FLFRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FLFResponse.fromBuffer(value));
  static final _$favourite = $grpc.ClientMethod<$0.FLFRequest, $0.FLFResponse>(
      '/Consumer/Favourite',
      ($0.FLFRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FLFResponse.fromBuffer(value));

  ConsumerClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.AuthResponse> login($0.LoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthResponse> register($0.RegisterRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyEmailResponse> verifyEmail($0.VerifyEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyEmail, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateProfileResponse> updateProfile($0.UpdateProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfile, request, options: options);
  }

  $grpc.ResponseFuture<$0.UploadResponse> updateProfilePic($0.UploadRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateProfilePic, request, options: options);
  }

  $grpc.ResponseFuture<$0.FeedResponse> feed($0.FeedRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$feed, request, options: options);
  }

  $grpc.ResponseFuture<$0.FeedResponse> favourites($0.FeedRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$favourites, request, options: options);
  }

  $grpc.ResponseFuture<$0.ProfileResponse> profile($0.ProfileRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$profile, request, options: options);
  }

  $grpc.ResponseFuture<$0.VendorResponse> vendor($0.VendorRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$vendor, request, options: options);
  }

  $grpc.ResponseFuture<$0.FLFResponse> like($0.FLFRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$like, request, options: options);
  }

  $grpc.ResponseFuture<$0.FLFResponse> follow($0.FLFRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$follow, request, options: options);
  }

  $grpc.ResponseFuture<$0.FLFResponse> favourite($0.FLFRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$favourite, request, options: options);
  }
}

@$pb.GrpcServiceName('Consumer')
abstract class ConsumerServiceBase extends $grpc.Service {
  $core.String get $name => 'Consumer';

  ConsumerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.AuthResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.AuthResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyEmailRequest, $0.VerifyEmailResponse>(
        'VerifyEmail',
        verifyEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VerifyEmailRequest.fromBuffer(value),
        ($0.VerifyEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateProfileRequest, $0.UpdateProfileResponse>(
        'UpdateProfile',
        updateProfile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateProfileRequest.fromBuffer(value),
        ($0.UpdateProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UploadRequest, $0.UploadResponse>(
        'UpdateProfilePic',
        updateProfilePic_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UploadRequest.fromBuffer(value),
        ($0.UploadResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FeedRequest, $0.FeedResponse>(
        'Feed',
        feed_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FeedRequest.fromBuffer(value),
        ($0.FeedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FeedRequest, $0.FeedResponse>(
        'Favourites',
        favourites_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FeedRequest.fromBuffer(value),
        ($0.FeedResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ProfileRequest, $0.ProfileResponse>(
        'Profile',
        profile_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ProfileRequest.fromBuffer(value),
        ($0.ProfileResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VendorRequest, $0.VendorResponse>(
        'Vendor',
        vendor_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VendorRequest.fromBuffer(value),
        ($0.VendorResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FLFRequest, $0.FLFResponse>(
        'Like',
        like_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FLFRequest.fromBuffer(value),
        ($0.FLFResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FLFRequest, $0.FLFResponse>(
        'Follow',
        follow_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FLFRequest.fromBuffer(value),
        ($0.FLFResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FLFRequest, $0.FLFResponse>(
        'Favourite',
        favourite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FLFRequest.fromBuffer(value),
        ($0.FLFResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthResponse> login_Pre($grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.AuthResponse> register_Pre($grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.VerifyEmailResponse> verifyEmail_Pre($grpc.ServiceCall call, $async.Future<$0.VerifyEmailRequest> request) async {
    return verifyEmail(call, await request);
  }

  $async.Future<$0.UpdateProfileResponse> updateProfile_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateProfileRequest> request) async {
    return updateProfile(call, await request);
  }

  $async.Future<$0.UploadResponse> updateProfilePic_Pre($grpc.ServiceCall call, $async.Future<$0.UploadRequest> request) async {
    return updateProfilePic(call, await request);
  }

  $async.Future<$0.FeedResponse> feed_Pre($grpc.ServiceCall call, $async.Future<$0.FeedRequest> request) async {
    return feed(call, await request);
  }

  $async.Future<$0.FeedResponse> favourites_Pre($grpc.ServiceCall call, $async.Future<$0.FeedRequest> request) async {
    return favourites(call, await request);
  }

  $async.Future<$0.ProfileResponse> profile_Pre($grpc.ServiceCall call, $async.Future<$0.ProfileRequest> request) async {
    return profile(call, await request);
  }

  $async.Future<$0.VendorResponse> vendor_Pre($grpc.ServiceCall call, $async.Future<$0.VendorRequest> request) async {
    return vendor(call, await request);
  }

  $async.Future<$0.FLFResponse> like_Pre($grpc.ServiceCall call, $async.Future<$0.FLFRequest> request) async {
    return like(call, await request);
  }

  $async.Future<$0.FLFResponse> follow_Pre($grpc.ServiceCall call, $async.Future<$0.FLFRequest> request) async {
    return follow(call, await request);
  }

  $async.Future<$0.FLFResponse> favourite_Pre($grpc.ServiceCall call, $async.Future<$0.FLFRequest> request) async {
    return favourite(call, await request);
  }

  $async.Future<$0.AuthResponse> login($grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.AuthResponse> register($grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.VerifyEmailResponse> verifyEmail($grpc.ServiceCall call, $0.VerifyEmailRequest request);
  $async.Future<$0.UpdateProfileResponse> updateProfile($grpc.ServiceCall call, $0.UpdateProfileRequest request);
  $async.Future<$0.UploadResponse> updateProfilePic($grpc.ServiceCall call, $0.UploadRequest request);
  $async.Future<$0.FeedResponse> feed($grpc.ServiceCall call, $0.FeedRequest request);
  $async.Future<$0.FeedResponse> favourites($grpc.ServiceCall call, $0.FeedRequest request);
  $async.Future<$0.ProfileResponse> profile($grpc.ServiceCall call, $0.ProfileRequest request);
  $async.Future<$0.VendorResponse> vendor($grpc.ServiceCall call, $0.VendorRequest request);
  $async.Future<$0.FLFResponse> like($grpc.ServiceCall call, $0.FLFRequest request);
  $async.Future<$0.FLFResponse> follow($grpc.ServiceCall call, $0.FLFRequest request);
  $async.Future<$0.FLFResponse> favourite($grpc.ServiceCall call, $0.FLFRequest request);
}
