// install: flutter pub add http

import 'package:get_all/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostServices {
  var client = http.Client();

  Future<List<PostModel>?> getPosts() async {
    try {
      var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return postFromJson(json);
      } else {
        throw ("Failed to get posts");
      }
    } catch (e) {
      rethrow;
    }
  }
}
