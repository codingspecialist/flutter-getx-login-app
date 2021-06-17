import 'package:get/get_connect/connect.dart';

const host = "http://192.168.0.5:8080";

class UserProvider extends GetConnect {
  // Get request
  Future<Response> findAll() => get('$host/user');
  // Get request
  Future<Response> findById(int id) => get('$host/user/$id');
  // Post request
  Future<Response> login(Map data) => post('$host/user/login', data);
  // Post request
  Future<Response> save(Map data) => post('$host/user', data);
}

UserProvider userProvider = UserProvider();
