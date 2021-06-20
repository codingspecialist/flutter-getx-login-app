# flutter_getx_app

## 참고
https://sudarlife.tistory.com/entry/%EC%83%81%ED%83%9C%EA%B4%80%EB%A6%AC%EC%9D%98-%EB%81%9D%ED%8C%90%EC%99%95-GetX%EB%A5%BC-%EC%A0%95%EB%A6%AC%ED%95%B4-%EB%B3%B4%EC%95%98%EB%8B%A4

## 상태 옵저버 변수
final name = ''.obs;
final isLogged = false.obs;
final count = 0.obs;
final balance = 0.0.obs;
final number = 0.obs;
final items = <String>[].obs;
final myMap = <String, int>{}.obs;
final user = User().obs;

## Map<String, dynamic> - jsonString
jsonDecode()
jsonEncode()

## Transition 화면 변화
Get.to(SamplePage(), transition: Transition.downToUp);

enum Transition {
  fade,
  fadeIn,
  rightToLeft,
  leftToRight,
  upToDown,
  downToUp,
  rightToLeftWithFade,
  leftToRightWithFade,
  zoom,
  topLevel,
  noTransition,
  cupertino,
  cupertinoDialog,
  size,
  native
}

## NamedParameters 전달 방법
void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/',
      getPages: [
      GetPage(
        name: '/profile/',
        page: () => MyProfile(),
      ),
       //You can define a different page for routes with arguments, and another without arguments, but for that you must use the slash '/' on the route that will not receive arguments as above.
       GetPage(
        name: '/profile/:user',
        page: () => UserProfile(),
      ),
     ],
    )
  );
}

Get.toNamed("/profile/34954");