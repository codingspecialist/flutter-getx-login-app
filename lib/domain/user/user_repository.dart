import 'dart:convert';

import 'package:flutter_getx_app/controller/user/LoginReqDto.dart';
import 'package:flutter_getx_app/domain/user/user.dart';
import 'package:flutter_getx_app/domain/user/user_provider.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class UserRepository {
  final UserProvider userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    LoginReqDto loginReqDto =
        LoginReqDto(username: username, password: password);
    Response response = await userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers;
    String token = headers["authorization"];
    print("응답된 토큰 값 : $token");

    return token;
  }
}
