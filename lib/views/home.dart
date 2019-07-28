import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  final String text;

  const HomePage({Key key, this.text}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: _Demo(name: "J",),
    );
  }
}


class _Demo extends StatelessWidget {
  final name;

  const _Demo({Key key, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Text(name);
  }

}