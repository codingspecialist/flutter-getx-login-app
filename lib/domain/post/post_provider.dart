import 'dart:convert';

import 'package:flutter_getx_app/domain/post/post.dart';
import 'package:flutter_getx_app/util/convert_utf8.dart';
import 'package:flutter_getx_app/util/jwt.dart';
import 'package:get/get_connect/connect.dart';

const host = "http://192.168.0.5:8080";

class PostProvider extends GetConnect {
  // Get request
  Future<Response<List<Post>>> findAll() =>
      get('$host/post', headers: jwtToken, decoder: (data) {
        return (data as List<dynamic>)
            .map((data) => Post.fromJson(convertUtf8toObject(data)))
            .toList();
      });

  // Get request
  Future<Response<Post>> findById(int id) => get(
        '$host/post/$id',
        headers: jwtToken,
        decoder: (data) {
          return Post.fromJson(convertUtf8toObject(data));
        },
      );
  // Post request

  Future<Response> save(Map data) => post('$host/post', data);
}
