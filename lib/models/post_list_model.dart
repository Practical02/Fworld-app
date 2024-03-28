// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'dart:convert';

FeedModel feedModelFromJson(String str) => FeedModel.fromJson(json.decode(str));

String feedModelToJson(FeedModel data) => json.encode(data.toJson());

class FeedModel {
    List<PostModel> data;

    FeedModel({
        required this.data,
    });

    factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        data: List<PostModel>.from(json["data"].map((x) => PostModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class PostModel {
    String id;
    String vendorId;
    String name;
    String service;
    String url;
    List<String> tags;

    PostModel({
        required this.id,
        required this.vendorId,
        required this.name,
        required this.service,
        required this.url,
        required this.tags,
    });

    factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["ID"],
        vendorId: json["vendor_id"],
        name: json["name"],
        service: json["service"],
        url: json["url"],
        tags: List<String>.from(json["tags"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "vendor_id": vendorId,
        "name": name,
        "service": service,
        "url": url,
        "tags": List<dynamic>.from(tags.map((x) => x)),
    };
}
