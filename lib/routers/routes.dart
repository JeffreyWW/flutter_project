import 'package:fluro/fluro.dart';
import 'package:flutter_project/routers/router_handler.dart';

class Routes {
  static String home = '/';
  static String my = "/my";
  static String test = "/test";

  static void configureRoutes(Router router) {
    ///实际上HandlerFunc类型的typedefs了一下,返回值是一个Widget
    router.define(home, handler: homeHandler);
    router.define(test, handler: testHandler);
  }
}
