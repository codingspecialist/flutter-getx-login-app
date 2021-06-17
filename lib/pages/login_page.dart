import 'package:flutter/material.dart';
import 'package:flutter_getx_app/controller/user_controller.dart';
import 'package:flutter_getx_app/domain/user/user.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<UserController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login Page"),
            TextButton(
              onPressed: () async {
                User userEntity = await controller.login("ssar", "1234");
                print("로그인 완료 : ${userEntity.username}");
                Get.toNamed("/home");
              },
              child: Text("로그인"),
            )
          ],
        ),
      ),
    );
  }
}
