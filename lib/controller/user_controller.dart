import 'package:flutter_getx_app/domain/user/user.dart';
import 'package:flutter_getx_app/domain/user/user_repository.dart';
import 'package:flutter_getx_app/util/jwt.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserRepository userRepository = UserRepository();
  final user = User().obs;
  final token = "".obs;

  Future<void> login(String username, String password) async {
    String token = await userRepository.login(username, password);
    this.token.value = token;
    jwtToken = {"Authorization": token};
  }
}
