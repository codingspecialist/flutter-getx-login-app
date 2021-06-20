import 'package:get/get_connect/connect.dart';

const host = "http://192.168.0.5:8080";

class UserProvider extends GetConnect {
  // Get request
  Future<Response> findAll() => get('$host/user');
  // Get request
  Future<Response> findById(int id) => get('$host/user/$id');
  // Post request
  Future<Response> login(Map data) => post('$host/login', data);
  // Post request
  Future<Response> save(Map data) => post('$host/user', data);

  @override
  void onInit() {
    httpClient.addAuthenticator<void>((request) async {
      print("나실행됨? addAuthenticator ");
      final response = await get("$host/login");
      dynamic headers = response.headers;
      final token = headers['authorization'];
      // 헤더 설정
      request.headers['Authorization'] = "$token";
      return request;
    });
  }
}
