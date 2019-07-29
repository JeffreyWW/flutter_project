import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_project/views/home_page/home_page.dart';
import 'package:flutter_project/views/my_page/my_page.dart';

class MainPage extends StatefulWidget {
  final String text;

  const MainPage({Key key, this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State {
  ///定义下标默认为0,以及对应的page和tabItems,逻辑需要自己写
  var _currentIndex = 0;
  static List<Widget> _pageList = [HomePage(), MyPage()];
  static List<BottomNavigationBarItem> _tabItems = [
    BottomNavigationBarItem(title: Text("首页"), icon: Icon(Icons.extension)),
    BottomNavigationBarItem(title: Text("我的"), icon: Icon(Icons.favorite))
  ];

  @override
  Widget build(BuildContext context) {
    ///Scaffold类型的Widget可以继承外部的主题
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _tabItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
