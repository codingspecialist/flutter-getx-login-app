import 'package:flutter_getx_app/domain/post/post.dart';
import 'package:flutter_getx_app/domain/post/post_provider.dart';

import 'package:flutter_getx_app/util/convert_utf8.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class PostRepository {
  final PostProvider postProvider = PostProvider();

  Future<List<Post>> findAll() async {
    Response<List<Post>> response = await postProvider.findAll();
    return response.body!;
  }

  Future<Post> findById(int id) async {
    Response<Post> response = await postProvider.findById(id);
    return response.body!;
  }
}
