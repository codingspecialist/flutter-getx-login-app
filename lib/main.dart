import 'package:flutter/material.dart';
import 'package:flutter_getx_app/controller/user_controller.dart';
import 'package:flutter_getx_app/pages/home_page.dart';
import 'package:flutter_getx_app/pages/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

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
        GetPage(name: '/home', page: () => HomePage(), binding: UserBind()),
      ],
    );
  }
}

class UserBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
  }
}
