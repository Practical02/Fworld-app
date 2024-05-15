//
//  Generated code. Do not modify.
//  source: consumer.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = {
  '1': 'LoginRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode(
    'CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUg'
    'hwYXNzd29yZA==');

@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = {
  '1': 'RegisterRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode(
    'Cg9SZWdpc3RlclJlcXVlc3QSEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgVlbWFpbBgCIAEoCVIFZW'
    '1haWwSGgoIcGFzc3dvcmQYAyABKAlSCHBhc3N3b3Jk');

@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = {
  '1': 'AuthResponse',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode(
    'CgxBdXRoUmVzcG9uc2USFAoFdG9rZW4YASABKAlSBXRva2Vu');

@$core.Deprecated('Use verifyEmailRequestDescriptor instead')
const VerifyEmailRequest$json = {
  '1': 'VerifyEmailRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'otp', '3': 2, '4': 1, '5': 5, '10': 'otp'},
  ],
};

/// Descriptor for `VerifyEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailRequestDescriptor = $convert.base64Decode(
    'ChJWZXJpZnlFbWFpbFJlcXVlc3QSFAoFdG9rZW4YASABKAlSBXRva2VuEhAKA290cBgCIAEoBV'
    'IDb3Rw');

@$core.Deprecated('Use verifyEmailResponseDescriptor instead')
const VerifyEmailResponse$json = {
  '1': 'VerifyEmailResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `VerifyEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyEmailResponseDescriptor = $convert.base64Decode(
    'ChNWZXJpZnlFbWFpbFJlc3BvbnNlEhgKB21lc3NhZ2UYASABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use profileRequestDescriptor instead')
const ProfileRequest$json = {
  '1': 'ProfileRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `ProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileRequestDescriptor = $convert.base64Decode(
    'Cg5Qcm9maWxlUmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4=');

@$core.Deprecated('Use profileResponseDescriptor instead')
const ProfileResponse$json = {
  '1': 'ProfileResponse',
  '2': [
    {'1': 'ID', '3': 1, '4': 1, '5': 9, '10': 'ID'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 4, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'imageUrl', '3': 5, '4': 1, '5': 9, '10': 'imageUrl'},
  ],
};

/// Descriptor for `ProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List profileResponseDescriptor = $convert.base64Decode(
    'Cg9Qcm9maWxlUmVzcG9uc2USDgoCSUQYASABKAlSAklEEhQKBWVtYWlsGAIgASgJUgVlbWFpbB'
    'ISCgRuYW1lGAMgASgJUgRuYW1lEhQKBXBob25lGAQgASgJUgVwaG9uZRIaCghpbWFnZVVybBgF'
    'IAEoCVIIaW1hZ2VVcmw=');

@$core.Deprecated('Use updateProfileRequestDescriptor instead')
const UpdateProfileRequest$json = {
  '1': 'UpdateProfileRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone', '3': 3, '4': 1, '5': 9, '10': 'phone'},
  ],
};

/// Descriptor for `UpdateProfileRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9maWxlUmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRIUCgVwaG9uZRgDIAEoCVIFcGhvbmU=');

@$core.Deprecated('Use updateProfileResponseDescriptor instead')
const UpdateProfileResponse$json = {
  '1': 'UpdateProfileResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateProfileResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProfileResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVQcm9maWxlUmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use uploadRequestDescriptor instead')
const UploadRequest$json = {
  '1': 'UploadRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'filename', '3': 2, '4': 1, '5': 9, '10': 'filename'},
    {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `UploadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadRequestDescriptor = $convert.base64Decode(
    'Cg1VcGxvYWRSZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbhIaCghmaWxlbmFtZRgCIAEoCV'
    'IIZmlsZW5hbWUSEgoEZGF0YRgDIAEoDFIEZGF0YQ==');

@$core.Deprecated('Use uploadResponseDescriptor instead')
const UploadResponse$json = {
  '1': 'UploadResponse',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `UploadResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uploadResponseDescriptor = $convert.base64Decode(
    'Cg5VcGxvYWRSZXNwb25zZRIQCgN1cmwYASABKAlSA3VybA==');

@$core.Deprecated('Use feedRequestDescriptor instead')
const FeedRequest$json = {
  '1': 'FeedRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
  ],
};

/// Descriptor for `FeedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedRequestDescriptor = $convert.base64Decode(
    'CgtGZWVkUmVxdWVzdBIUCgV0b2tlbhgBIAEoCVIFdG9rZW4=');

@$core.Deprecated('Use feedResponseDescriptor instead')
const FeedResponse$json = {
  '1': 'FeedResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 3, '5': 11, '6': '.Post', '10': 'post'},
  ],
};

/// Descriptor for `FeedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List feedResponseDescriptor = $convert.base64Decode(
    'CgxGZWVkUmVzcG9uc2USGQoEcG9zdBgBIAMoCzIFLlBvc3RSBHBvc3Q=');

@$core.Deprecated('Use fLFRequestDescriptor instead')
const FLFRequest$json = {
  '1': 'FLFRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'vendorID', '3': 2, '4': 1, '5': 9, '10': 'vendorID'},
  ],
};

/// Descriptor for `FLFRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fLFRequestDescriptor = $convert.base64Decode(
    'CgpGTEZSZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbhIaCgh2ZW5kb3JJRBgCIAEoCVIIdm'
    'VuZG9ySUQ=');

@$core.Deprecated('Use fLFResponseDescriptor instead')
const FLFResponse$json = {
  '1': 'FLFResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `FLFResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List fLFResponseDescriptor = $convert.base64Decode(
    'CgtGTEZSZXNwb25zZRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use searchRequestDescriptor instead')
const SearchRequest$json = {
  '1': 'SearchRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `SearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchRequestDescriptor = $convert.base64Decode(
    'Cg1TZWFyY2hSZXF1ZXN0EhQKBXF1ZXJ5GAEgASgJUgVxdWVyeQ==');

@$core.Deprecated('Use searchResponseDescriptor instead')
const SearchResponse$json = {
  '1': 'SearchResponse',
  '2': [
    {'1': 'vendor', '3': 1, '4': 3, '5': 11, '6': '.VendorMinimal', '10': 'vendor'},
  ],
};

/// Descriptor for `SearchResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchResponseDescriptor = $convert.base64Decode(
    'Cg5TZWFyY2hSZXNwb25zZRImCgZ2ZW5kb3IYASADKAsyDi5WZW5kb3JNaW5pbWFsUgZ2ZW5kb3'
    'I=');

@$core.Deprecated('Use vendorRequestDescriptor instead')
const VendorRequest$json = {
  '1': 'VendorRequest',
  '2': [
    {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    {'1': 'vendorID', '3': 2, '4': 1, '5': 9, '10': 'vendorID'},
  ],
};

/// Descriptor for `VendorRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorRequestDescriptor = $convert.base64Decode(
    'Cg1WZW5kb3JSZXF1ZXN0EhQKBXRva2VuGAEgASgJUgV0b2tlbhIaCgh2ZW5kb3JJRBgCIAEoCV'
    'IIdmVuZG9ySUQ=');

@$core.Deprecated('Use vendorResponseDescriptor instead')
const VendorResponse$json = {
  '1': 'VendorResponse',
  '2': [
    {'1': 'vendor', '3': 1, '4': 1, '5': 11, '6': '.VendorDescribed', '10': 'vendor'},
  ],
};

/// Descriptor for `VendorResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorResponseDescriptor = $convert.base64Decode(
    'Cg5WZW5kb3JSZXNwb25zZRIoCgZ2ZW5kb3IYASABKAsyEC5WZW5kb3JEZXNjcmliZWRSBnZlbm'
    'Rvcg==');

@$core.Deprecated('Use vendorDescribedDescriptor instead')
const VendorDescribed$json = {
  '1': 'VendorDescribed',
  '2': [
    {'1': 'ID', '3': 1, '4': 1, '5': 9, '10': 'ID'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
    {'1': 'services', '3': 4, '4': 3, '5': 9, '10': 'services'},
    {'1': 'locations', '3': 5, '4': 3, '5': 9, '10': 'locations'},
    {'1': 'likes', '3': 6, '4': 1, '5': 3, '10': 'likes'},
    {'1': 'followers', '3': 7, '4': 1, '5': 3, '10': 'followers'},
    {'1': 'isLiked', '3': 8, '4': 1, '5': 8, '10': 'isLiked'},
    {'1': 'isFollowed', '3': 9, '4': 1, '5': 8, '10': 'isFollowed'},
    {'1': 'isFavourited', '3': 10, '4': 1, '5': 8, '10': 'isFavourited'},
    {'1': 'posts', '3': 11, '4': 3, '5': 11, '6': '.Post', '10': 'posts'},
  ],
};

/// Descriptor for `VendorDescribed`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorDescribedDescriptor = $convert.base64Decode(
    'Cg9WZW5kb3JEZXNjcmliZWQSDgoCSUQYASABKAlSAklEEhIKBG5hbWUYAiABKAlSBG5hbWUSIA'
    'oLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9uEhoKCHNlcnZpY2VzGAQgAygJUghzZXJ2'
    'aWNlcxIcCglsb2NhdGlvbnMYBSADKAlSCWxvY2F0aW9ucxIUCgVsaWtlcxgGIAEoA1IFbGlrZX'
    'MSHAoJZm9sbG93ZXJzGAcgASgDUglmb2xsb3dlcnMSGAoHaXNMaWtlZBgIIAEoCFIHaXNMaWtl'
    'ZBIeCgppc0ZvbGxvd2VkGAkgASgIUgppc0ZvbGxvd2VkEiIKDGlzRmF2b3VyaXRlZBgKIAEoCF'
    'IMaXNGYXZvdXJpdGVkEhsKBXBvc3RzGAsgAygLMgUuUG9zdFIFcG9zdHM=');

@$core.Deprecated('Use vendorMinimalDescriptor instead')
const VendorMinimal$json = {
  '1': 'VendorMinimal',
  '2': [
    {'1': 'ID', '3': 1, '4': 1, '5': 9, '10': 'ID'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `VendorMinimal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vendorMinimalDescriptor = $convert.base64Decode(
    'Cg1WZW5kb3JNaW5pbWFsEg4KAklEGAEgASgJUgJJRBISCgRuYW1lGAIgASgJUgRuYW1l');

@$core.Deprecated('Use postDescriptor instead')
const Post$json = {
  '1': 'Post',
  '2': [
    {'1': 'ID', '3': 1, '4': 1, '5': 9, '10': 'ID'},
    {'1': 'ImageURL', '3': 2, '4': 1, '5': 9, '10': 'ImageURL'},
    {'1': 'Service', '3': 3, '4': 1, '5': 9, '10': 'Service'},
    {'1': 'Location', '3': 4, '4': 1, '5': 9, '10': 'Location'},
    {'1': 'VendorID', '3': 5, '4': 1, '5': 9, '10': 'VendorID'},
    {'1': 'VendorName', '3': 6, '4': 1, '5': 9, '10': 'VendorName'},
  ],
};

/// Descriptor for `Post`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDescriptor = $convert.base64Decode(
    'CgRQb3N0Eg4KAklEGAEgASgJUgJJRBIaCghJbWFnZVVSTBgCIAEoCVIISW1hZ2VVUkwSGAoHU2'
    'VydmljZRgDIAEoCVIHU2VydmljZRIaCghMb2NhdGlvbhgEIAEoCVIITG9jYXRpb24SGgoIVmVu'
    'ZG9ySUQYBSABKAlSCFZlbmRvcklEEh4KClZlbmRvck5hbWUYBiABKAlSClZlbmRvck5hbWU=');

