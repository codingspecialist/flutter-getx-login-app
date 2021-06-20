import 'dart:convert';

// getx에서는 utf8 convert를 지원안함. encode한 뒤 다시 decode 해야함.

dynamic convertUtf8toObject(dynamic data) {
  String responseBody = jsonEncode(data);
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}
