import 'package:flutter/material.dart';
import 'package:get_all/models/post_model.dart';
import 'package:get_all/services/post_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getPosts();
  }

  // get posts
  getPosts() async {
    posts = await PostServices().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get All Posts"),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text("title: ${posts?[index].title}"),
                Text("body: ${posts?[index].body ?? ''}"),
              ],
            );
          },
        ),
      ),
    );
  }
}
