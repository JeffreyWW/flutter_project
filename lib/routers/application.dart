///应用,暂时还没看到有什么作用,只是把路由添加进去了,个人觉得总体设计可以从这里入口
import 'package:fluro/fluro.dart';
import 'package:flutter_project/routers/routes.dart';

class Application {
  static final Router router = Router();

  static configure() {
    Routes.configureRoutes(router);
  }
}
