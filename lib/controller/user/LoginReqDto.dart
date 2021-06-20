class LoginReqDto {
  String? username;
  String? password;

  LoginReqDto({this.username, this.password});

  LoginReqDto.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
      };
}
