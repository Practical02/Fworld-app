//
//  Generated code. Do not modify.
//  source: vendor.proto
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

import 'vendor.pb.dart' as $0;

export 'vendor.pb.dart';

@$pb.GrpcServiceName('Vendor')
class VendorClient extends $grpc.Client {
  static final _$login = $grpc.ClientMethod<$0.VendorLoginRequest, $0.VendorAuthResponse>(
      '/Vendor/Login',
      ($0.VendorLoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VendorAuthResponse.fromBuffer(value));
  static final _$register = $grpc.ClientMethod<$0.VendorRegisterRequest, $0.VendorAuthResponse>(
      '/Vendor/Register',
      ($0.VendorRegisterRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VendorAuthResponse.fromBuffer(value));
  static final _$verifyEmail = $grpc.ClientMethod<$0.VendorVerifyEmailRequest, $0.VendorVerifyEmailResponse>(
      '/Vendor/VerifyEmail',
      ($0.VendorVerifyEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VendorVerifyEmailResponse.fromBuffer(value));
  static final _$updateDetails = $grpc.ClientMethod<$0.UpdateDetailsRequest, $0.UpdateDetailsResponse>(
      '/Vendor/UpdateDetails',
      ($0.UpdateDetailsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateDetailsResponse.fromBuffer(value));
  static final _$updateSocials = $grpc.ClientMethod<$0.UpdateSocialsRequest, $0.UpdateDetailsResponse>(
      '/Vendor/UpdateSocials',
      ($0.UpdateSocialsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateDetailsResponse.fromBuffer(value));

  VendorClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.VendorAuthResponse> login($0.VendorLoginRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.VendorAuthResponse> register($0.VendorRegisterRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.VendorVerifyEmailResponse> verifyEmail($0.VendorVerifyEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyEmail, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateDetailsResponse> updateDetails($0.UpdateDetailsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateDetails, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateDetailsResponse> updateSocials($0.UpdateSocialsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateSocials, request, options: options);
  }
}

@$pb.GrpcServiceName('Vendor')
abstract class VendorServiceBase extends $grpc.Service {
  $core.String get $name => 'Vendor';

  VendorServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.VendorLoginRequest, $0.VendorAuthResponse>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VendorLoginRequest.fromBuffer(value),
        ($0.VendorAuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VendorRegisterRequest, $0.VendorAuthResponse>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VendorRegisterRequest.fromBuffer(value),
        ($0.VendorAuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VendorVerifyEmailRequest, $0.VendorVerifyEmailResponse>(
        'VerifyEmail',
        verifyEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.VendorVerifyEmailRequest.fromBuffer(value),
        ($0.VendorVerifyEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateDetailsRequest, $0.UpdateDetailsResponse>(
        'UpdateDetails',
        updateDetails_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateDetailsRequest.fromBuffer(value),
        ($0.UpdateDetailsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateSocialsRequest, $0.UpdateDetailsResponse>(
        'UpdateSocials',
        updateSocials_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateSocialsRequest.fromBuffer(value),
        ($0.UpdateDetailsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.VendorAuthResponse> login_Pre($grpc.ServiceCall call, $async.Future<$0.VendorLoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.VendorAuthResponse> register_Pre($grpc.ServiceCall call, $async.Future<$0.VendorRegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.VendorVerifyEmailResponse> verifyEmail_Pre($grpc.ServiceCall call, $async.Future<$0.VendorVerifyEmailRequest> request) async {
    return verifyEmail(call, await request);
  }

  $async.Future<$0.UpdateDetailsResponse> updateDetails_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateDetailsRequest> request) async {
    return updateDetails(call, await request);
  }

  $async.Future<$0.UpdateDetailsResponse> updateSocials_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateSocialsRequest> request) async {
    return updateSocials(call, await request);
  }

  $async.Future<$0.VendorAuthResponse> login($grpc.ServiceCall call, $0.VendorLoginRequest request);
  $async.Future<$0.VendorAuthResponse> register($grpc.ServiceCall call, $0.VendorRegisterRequest request);
  $async.Future<$0.VendorVerifyEmailResponse> verifyEmail($grpc.ServiceCall call, $0.VendorVerifyEmailRequest request);
  $async.Future<$0.UpdateDetailsResponse> updateDetails($grpc.ServiceCall call, $0.UpdateDetailsRequest request);
  $async.Future<$0.UpdateDetailsResponse> updateSocials($grpc.ServiceCall call, $0.UpdateSocialsRequest request);
}
