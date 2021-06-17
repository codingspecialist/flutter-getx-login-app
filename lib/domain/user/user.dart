class User {
  final int id;
  final String username;
  final String password;

  User(this.id, this.username, this.password);
  User.origin()
      : id = 0,
        username = "",
        password = "";

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        username = json['username'],
        password = json["password"];

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password': password,
      };
}
