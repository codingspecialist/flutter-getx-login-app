import 'package:flutter/material.dart';
import 'package:flutter_getx_app/controller/post_controller.dart';
import 'package:flutter_getx_app/controller/user_controller.dart';
import 'package:flutter_getx_app/domain/post/post.dart';
import 'package:get/get.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    PostController p = Get.find();
    Future<Post> fPost = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text("username : ${u.token}"),
      ),
      body: Scaffold(
        body: Column(
          children: [
            FutureBuilder<Post>(
              future: fPost,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data!.title}");
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            Obx(() => Text("${p.post.value.content ?? ''}")),
            Obx(
              () => Expanded(
                child: ListView.builder(
                  itemCount: p.posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("${p.posts[index].id}"),
                      title: Text("${p.posts[index].title}"),
                      subtitle: Text("${p.posts[index].created}"),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            p.findAll();
            p.findById();
            Get.snackbar("초기화 끝", "잘했어", snackPosition: SnackPosition.TOP);
            Get.showSnackbar(
              GetBar(
                title: 'Snackbar',
                message: 'Snackbar',
                duration: Duration(seconds: 2),
                snackPosition: SnackPosition.BOTTOM,
              ),
            );
          },
          child: Text("로드"),
        ),
      ),
    );
  }
}
