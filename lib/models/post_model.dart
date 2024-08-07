import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((item) => Post.fromJson(item)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((item) => item.toJson())));

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    this.body,
  });

  final int userId;
  final int id;
  final String title;
  String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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
