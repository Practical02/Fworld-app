//
//  Generated code. Do not modify.
//  source: vendor.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use vendorLoginRequestDescriptor instead')
const VendorLoginRequest$json = {
  '1': 'VendorLoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `VendorLoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorLoginRequestDescriptor = $convert.base64Decode(
    'ChJWZW5kb3JMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGA'
    'IgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use vendorRegisterRequestDescriptor instead')
const VendorRegisterRequest$json = {
  '1': 'VendorRegisterRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `VendorRegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorRegisterRequestDescriptor = $convert.base64Decode(
    'ChVWZW5kb3JSZWdpc3RlclJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVlbWFpbBgCIA'
    'EoCVIFZW1haWwSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use vendorAuthResponseDescriptor instead')
const VendorAuthResponse$json = {
  '1': 'VendorAuthResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `VendorAuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorAuthResponseDescriptor = $convert.base64Decode(
    'ChJWZW5kb3JBdXRoUmVzcG9uc2USFAoFdG9rZW4YASABKAlSBXRva2Vu');

@$core.Deprecated('Use vendorVerifyEmailRequestDescriptor instead')
const VendorVerifyEmailRequest$json = {
  '1': 'VendorVerifyEmailRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'otp', '3': 2, '4': 1, '5': 5, '10': 'otp'},
  ],
};

/// Descriptor for `VendorVerifyEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorVerifyEmailRequestDescriptor = $convert.base64Decode(
    'ChhWZW5kb3JWZXJpZnlFbWFpbFJlcXVlc3QSFAoFdG9rZW4YASABKAlSBXRva2VuEhAKA290cB'
    'gCIAEoBVIDb3Rw');

@$core.Deprecated('Use vendorVerifyEmailResponseDescriptor instead')
const VendorVerifyEmailResponse$json = {
  '1': 'VendorVerifyEmailResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `VendorVerifyEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorVerifyEmailResponseDescriptor = $convert.base64Decode(
    'ChlWZW5kb3JWZXJpZnlFbWFpbFJlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use updateDetailsRequestDescriptor instead')
const UpdateDetailsRequest$json = {
  '1': 'UpdateDetailsRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'services', '3': 4, '4': 1, '5': 9, '10': 'services'},
    {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `UpdateDetailsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDetailsRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVEZXRhaWxzUmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRIgCgtkZXNjcmlwdGlvbhgDIAEoCVILZGVzY3JpcHRpb24SGgoIc2VydmljZXMY'
    'BCABKAlSCHNlcnZpY2VzEhQKBXBob25lGAUgASgJUgVwaG9uZQ==');

@$core.Deprecated('Use updateSocialsRequestDescriptor instead')
const UpdateSocialsRequest$json = {
  '1': 'UpdateSocialsRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'image', '3': 2, '4': 1, '5': 12, '10': 'image'},
    {'1': 'Filename', '3': 3, '4': 1, '5': 9, '10': 'Filename'},
    {'1': 'instagram', '3': 4, '4': 1, '5': 9, '10': 'instagram'},
    {'1': 'facebook', '3': 5, '4': 1, '5': 9, '10': 'facebook'},
  ],
};

/// Descriptor for `UpdateSocialsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSocialsRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVTb2NpYWxzUmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SFAoFaW1hZ2UYAi'
    'ABKAxSBWltYWdlEhoKCEZpbGVuYW1lGAMgASgJUghGaWxlbmFtZRIcCglpbnN0YWdyYW0YBCAB'
    'KAlSCWluc3RhZ3JhbRIaCghmYWNlYm9vaxgFIAEoCVIIZmFjZWJvb2s=');

@$core.Deprecated('Use updateDetailsResponseDescriptor instead')
const UpdateDetailsResponse$json = {
  '1': 'UpdateDetailsResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateDetailsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDetailsResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVEZXRhaWxzUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

