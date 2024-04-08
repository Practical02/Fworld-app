// To parse this JSON data, do
//
//     final vendorModel = vendorModelFromJson(jsonString);

import 'dart:convert';

import 'package:function_world_app/models/post_list_model.dart';

VendorModel vendorModelFromJson(String str) => VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
    VendorData data;

    VendorModel({
      required this.data,
    });

    factory VendorModel.empty() {
      return VendorModel(data: VendorData(
        vendorId: "",
        name: "",
        email: "",
        phone: "",
        description: "",
        followers: 0,
        likes: 0,
        isFollowed: false,
        isLiked: false,
        isFavourited: false,
        services: [],
        posts: [],
      ));
    }


    factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        data: VendorData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class VendorData {
    String vendorId;
    String name;
    String email;
    String phone;
    String description;
    int followers;
    int likes;
    bool isFollowed;
    bool isLiked;
    bool isFavourited;
    List<String> services;
    List<PostModel> posts;

    VendorData({
      required this.vendorId,
      required this.name,
      required this.email,
      required this.phone,
      required this.description,
      required this.followers,
      required this.likes,
      required this.isFollowed,
      required this.isLiked,
      required this.isFavourited,
      required this.services,
      required this.posts
    });

    factory VendorData.fromJson(Map<String, dynamic> json) => VendorData(
        vendorId: json["vendor_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        description: json["description"],
        followers: json["followers"],
        likes: json["likes"],
        isFollowed: json["is_followed"],
        isLiked: json["is_liked"],
        isFavourited: json["is_favourited"],
        services: List<String>.from(json["services"].map((x) => x)),
        posts: List<PostModel>.from(json["Posts"].map((x) => PostModel.fromJson(x)))
    );

    Map<String, dynamic> toJson() => {
        "vendor_id": vendorId,
        "name": name,
        "email": email,
        "phone": phone,
        "description": description,
        "followers": followers,
        "likes": likes,
        "is_followed": isFollowed,
        "is_liked": isLiked,
        "is_favourited": isFavourited,
        "services": List<dynamic>.from(services.map((x) => x)),
        "Posts": List<PostModel>.from(posts.map((x) => x))
    };
}
