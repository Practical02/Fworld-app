
import 'dart:convert';

ErrorResponseModel errorModelFromJson(String str) => ErrorResponseModel.fromJson(json.decode(str));


class ErrorResponseModel {
  String error;

  ErrorResponseModel({
    required this.error
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) => ErrorResponseModel(
      error: json["error"],
    );
}