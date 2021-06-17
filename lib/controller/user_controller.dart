import 'package:flutter_getx_app/domain/user/user.dart';
import 'package:flutter_getx_app/domain/user/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final user = User.origin().obs;

  Future<User> login(String username, String password) async {
    User userEntity = await userRepository.login(username, password);
    user.value = userEntity;
    return userEntity;
  }
}
