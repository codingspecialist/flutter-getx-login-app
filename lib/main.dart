import 'package:flutter/material.dart';
import 'package:flutter_getx_app/controller/post_controller.dart';
import 'package:flutter_getx_app/controller/user_controller.dart';
import 'package:flutter_getx_app/domain/post/post_provider.dart';
import 'package:flutter_getx_app/domain/post/post_repository.dart';
import 'package:flutter_getx_app/pages/post/post_page.dart';
import 'package:flutter_getx_app/pages/user/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'domain/post/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/login",
      getPages: [
        GetPage(name: '/login', page: () => LoginPage(), binding: UserBind()),
        GetPage(name: '/post', page: () => PostPage(), binding: PostBind()),
      ],
    );
  }
}

// onInit 에서 무거운 데이터를 미리 로드하고 싶을 때 사용한다.
// 사용을 위해서는 Get.find() 를 사용한다.
class UserBind extends Bindings {
  @override
  void dependencies() {
    print("UserBind 실행");
    Get.lazyPut(() => UserController());
  }
}

class PostBind extends Bindings {
  PostRepository p = PostRepository();
  @override
  void dependencies() {
    print("PostBind 실행");
    Get.lazyPut(() => PostController());
    // 이런식으로 미리 당길 수 있다. 지금은 의미 없지만 문법은 알아두면 좋을듯
    // 왜냐면 다른 Bind에서 미리 실행시켜서 화면 전환전에 초기화가 가능하다.
    Get.put<Future<Post>>(p.findById(7));
  }
}
