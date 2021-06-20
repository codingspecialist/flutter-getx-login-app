import 'package:flutter/material.dart';
import 'package:flutter_getx_app/controller/user_controller.dart';
import 'package:flutter_getx_app/domain/user/user.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController u = Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login Page"),
            TextButton(
              onPressed: () async {
                await u.login("ssar", "1234");
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
