import 'package:flutter_project/models/floor.dart';
import 'package:flutter_project/network/index.dart';
import 'package:rxdart/rxdart.dart';

class FloorRepositories {
  static Observable getHomeFloor() {
    return NetworkManager.observable("MC0011",
            bodyBody: {"userNo": "", "pageType": "00"})
        .map((data) => Floor.fromJsonMap(data));
  }
}
