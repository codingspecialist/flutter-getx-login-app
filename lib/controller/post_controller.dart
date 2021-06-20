import 'package:flutter_getx_app/domain/post/post.dart';
import 'package:flutter_getx_app/domain/post/post_repository.dart';

import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository postRepository = PostRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  Future<void> findAll() async {
    List<Post> posts = await postRepository.findAll();
    this.posts.value = posts;
  }

  Future<void> findById() async {
    Post post = await postRepository.findById(7);
    this.post.value = post;
  }
}
