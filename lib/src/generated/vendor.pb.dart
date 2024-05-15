//
//  Generated code. Do not modify.
//  source: vendor.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class VendorLoginRequest extends $pb.GeneratedMessage {
  factory VendorLoginRequest({
    $core.String? email,
    $core.String? password,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  VendorLoginRequest._() : super();
  factory VendorLoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VendorLoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VendorLoginRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VendorLoginRequest clone() => VendorLoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VendorLoginRequest copyWith(void Function(VendorLoginRequest) updates) => super.copyWith((message) => updates(message as VendorLoginRequest)) as VendorLoginRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VendorLoginRequest create() => VendorLoginRequest._();
  VendorLoginRequest createEmptyInstance() => create();
  static $pb.PbList<VendorLoginRequest> createRepeated() => $pb.PbList<VendorLoginRequest>();
  @$core.pragma('dart2js:noInline')
  static VendorLoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VendorLoginRequest>(create);
  static VendorLoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class VendorRegisterRequest extends $pb.GeneratedMessage {
  factory VendorRegisterRequest({
    $core.String? name,
    $core.String? email,
    $core.String? password,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (email != null) {
      $result.email = email;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  VendorRegisterRequest._() : super();
  factory VendorRegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VendorRegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VendorRegisterRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VendorRegisterRequest clone() => VendorRegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VendorRegisterRequest copyWith(void Function(VendorRegisterRequest) updates) => super.copyWith((message) => updates(message as VendorRegisterRequest)) as VendorRegisterRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VendorRegisterRequest create() => VendorRegisterRequest._();
  VendorRegisterRequest createEmptyInstance() => create();
  static $pb.PbList<VendorRegisterRequest> createRepeated() => $pb.PbList<VendorRegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static VendorRegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VendorRegisterRequest>(create);
  static VendorRegisterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class VendorAuthResponse extends $pb.GeneratedMessage {
  factory VendorAuthResponse({
    $core.String? token,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    return $result;
  }
  VendorAuthResponse._() : super();
  factory VendorAuthResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VendorAuthResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VendorAuthResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VendorAuthResponse clone() => VendorAuthResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VendorAuthResponse copyWith(void Function(VendorAuthResponse) updates) => super.copyWith((message) => updates(message as VendorAuthResponse)) as VendorAuthResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VendorAuthResponse create() => VendorAuthResponse._();
  VendorAuthResponse createEmptyInstance() => create();
  static $pb.PbList<VendorAuthResponse> createRepeated() => $pb.PbList<VendorAuthResponse>();
  @$core.pragma('dart2js:noInline')
  static VendorAuthResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VendorAuthResponse>(create);
  static VendorAuthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);
}

class VendorVerifyEmailRequest extends $pb.GeneratedMessage {
  factory VendorVerifyEmailRequest({
    $core.String? token,
    $core.int? otp,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    if (otp != null) {
      $result.otp = otp;
    }
    return $result;
  }
  VendorVerifyEmailRequest._() : super();
  factory VendorVerifyEmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VendorVerifyEmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VendorVerifyEmailRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'otp', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VendorVerifyEmailRequest clone() => VendorVerifyEmailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VendorVerifyEmailRequest copyWith(void Function(VendorVerifyEmailRequest) updates) => super.copyWith((message) => updates(message as VendorVerifyEmailRequest)) as VendorVerifyEmailRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VendorVerifyEmailRequest create() => VendorVerifyEmailRequest._();
  VendorVerifyEmailRequest createEmptyInstance() => create();
  static $pb.PbList<VendorVerifyEmailRequest> createRepeated() => $pb.PbList<VendorVerifyEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static VendorVerifyEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VendorVerifyEmailRequest>(create);
  static VendorVerifyEmailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get otp => $_getIZ(1);
  @$pb.TagNumber(2)
  set otp($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOtp() => $_has(1);
  @$pb.TagNumber(2)
  void clearOtp() => clearField(2);
}

class VendorVerifyEmailResponse extends $pb.GeneratedMessage {
  factory VendorVerifyEmailResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  VendorVerifyEmailResponse._() : super();
  factory VendorVerifyEmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VendorVerifyEmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VendorVerifyEmailResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VendorVerifyEmailResponse clone() => VendorVerifyEmailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VendorVerifyEmailResponse copyWith(void Function(VendorVerifyEmailResponse) updates) => super.copyWith((message) => updates(message as VendorVerifyEmailResponse)) as VendorVerifyEmailResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VendorVerifyEmailResponse create() => VendorVerifyEmailResponse._();
  VendorVerifyEmailResponse createEmptyInstance() => create();
  static $pb.PbList<VendorVerifyEmailResponse> createRepeated() => $pb.PbList<VendorVerifyEmailResponse>();
  @$core.pragma('dart2js:noInline')
  static VendorVerifyEmailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VendorVerifyEmailResponse>(create);
  static VendorVerifyEmailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

class UpdateDetailsRequest extends $pb.GeneratedMessage {
  factory UpdateDetailsRequest({
    $core.String? token,
    $core.String? name,
    $core.String? description,
    $core.String? services,
    $core.String? phone,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (services != null) {
      $result.services = services;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    return $result;
  }
  UpdateDetailsRequest._() : super();
  factory UpdateDetailsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDetailsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDetailsRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'services')
    ..aOS(5, _omitFieldNames ? '' : 'phone')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDetailsRequest clone() => UpdateDetailsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDetailsRequest copyWith(void Function(UpdateDetailsRequest) updates) => super.copyWith((message) => updates(message as UpdateDetailsRequest)) as UpdateDetailsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDetailsRequest create() => UpdateDetailsRequest._();
  UpdateDetailsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateDetailsRequest> createRepeated() => $pb.PbList<UpdateDetailsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateDetailsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDetailsRequest>(create);
  static UpdateDetailsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get services => $_getSZ(3);
  @$pb.TagNumber(4)
  set services($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasServices() => $_has(3);
  @$pb.TagNumber(4)
  void clearServices() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phone => $_getSZ(4);
  @$pb.TagNumber(5)
  set phone($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => clearField(5);
}

class UpdateSocialsRequest extends $pb.GeneratedMessage {
  factory UpdateSocialsRequest({
    $core.String? token,
    $core.List<$core.int>? image,
    $core.String? filename,
    $core.String? instagram,
    $core.String? facebook,
  }) {
    final $result = create();
    if (token != null) {
      $result.token = token;
    }
    if (image != null) {
      $result.image = image;
    }
    if (filename != null) {
      $result.filename = filename;
    }
    if (instagram != null) {
      $result.instagram = instagram;
    }
    if (facebook != null) {
      $result.facebook = facebook;
    }
    return $result;
  }
  UpdateSocialsRequest._() : super();
  factory UpdateSocialsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSocialsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSocialsRequest', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'image', $pb.PbFieldType.OY)
    ..aOS(3, _omitFieldNames ? '' : 'Filename', protoName: 'Filename')
    ..aOS(4, _omitFieldNames ? '' : 'instagram')
    ..aOS(5, _omitFieldNames ? '' : 'facebook')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSocialsRequest clone() => UpdateSocialsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSocialsRequest copyWith(void Function(UpdateSocialsRequest) updates) => super.copyWith((message) => updates(message as UpdateSocialsRequest)) as UpdateSocialsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSocialsRequest create() => UpdateSocialsRequest._();
  UpdateSocialsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSocialsRequest> createRepeated() => $pb.PbList<UpdateSocialsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSocialsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSocialsRequest>(create);
  static UpdateSocialsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get image => $_getN(1);
  @$pb.TagNumber(2)
  set image($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get filename => $_getSZ(2);
  @$pb.TagNumber(3)
  set filename($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFilename() => $_has(2);
  @$pb.TagNumber(3)
  void clearFilename() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get instagram => $_getSZ(3);
  @$pb.TagNumber(4)
  set instagram($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInstagram() => $_has(3);
  @$pb.TagNumber(4)
  void clearInstagram() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get facebook => $_getSZ(4);
  @$pb.TagNumber(5)
  set facebook($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasFacebook() => $_has(4);
  @$pb.TagNumber(5)
  void clearFacebook() => clearField(5);
}

class UpdateDetailsResponse extends $pb.GeneratedMessage {
  factory UpdateDetailsResponse({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  UpdateDetailsResponse._() : super();
  factory UpdateDetailsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateDetailsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateDetailsResponse', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateDetailsResponse clone() => UpdateDetailsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateDetailsResponse copyWith(void Function(UpdateDetailsResponse) updates) => super.copyWith((message) => updates(message as UpdateDetailsResponse)) as UpdateDetailsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateDetailsResponse create() => UpdateDetailsResponse._();
  UpdateDetailsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateDetailsResponse> createRepeated() => $pb.PbList<UpdateDetailsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateDetailsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateDetailsResponse>(create);
  static UpdateDetailsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
