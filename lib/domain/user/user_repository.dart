import 'package:flutter_getx_app/domain/user/user.dart';
import 'package:flutter_getx_app/domain/user/user_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class UserRepository {
  Future<User> login(String username, String password) async {
    User user = User(0, username, password);
    print(user.toJson());
    Response response = await userProvider.login(user.toJson());
    dynamic responseUser = await response.body;
    User userEntity = User.fromJson(responseUser);
    print(userEntity);
    return userEntity;
  }
}

UserRepository userRepository = UserRepository();
