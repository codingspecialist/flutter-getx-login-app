import 'package:flutter/material.dart';
import 'package:flutter_getx_app/controller/post_controller.dart';
import 'package:flutter_getx_app/controller/user_controller.dart';
import 'package:get/get.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    PostController p = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("username : ${u.token}"),
      ),
      body: Scaffold(
        body: Column(
          children: [
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
          },
          child: Text("로드"),
        ),
      ),
    );
  }
}
