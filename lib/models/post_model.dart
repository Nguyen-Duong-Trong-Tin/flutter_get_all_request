import 'dart:convert';

List<PostModel> postFromJson(String str) => List<PostModel>.from(
    json.decode(str).map((item) => PostModel.fromJson(item)));

String postToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((item) => item.toJson())));

class PostModel {
  final int userId;
  final int id;
  final String title;
  String? body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
