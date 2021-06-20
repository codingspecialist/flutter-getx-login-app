import 'package:flutter_getx_app/domain/user/user.dart';
import 'package:intl/intl.dart';

class Post {
  int? id;
  String? title;
  String? content;
  User? user;
  DateTime? created;

  Post({this.id, this.title, this.content, this.user, this.created});

  Post.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        content = json["content"],
        user = User.fromJson(json["user"]),
        created = DateFormat("yyyy-MM-dd").parse(json["created"]);
  //created = DateTime.parse(json["created"])
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'user': user,
        'created': created
      };
}
