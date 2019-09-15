import 'package:flutter/material.dart';

typedef StateCallBack = ButtonState Function(ButtonState state);

enum ButtonState {
  normal,
  selected,
}

class StateIconButton extends StatefulWidget {
  final ButtonState initState;
  final StateCallBack onPress;
  final Size iconSize;
  final Map<ButtonState, Widget> iconSet;

  StateIconButton(
      {@required this.onPress,
      this.initState = ButtonState.normal,
      Key key,
      this.iconSet,
      this.iconSize})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StateIconButtonState(onPress, initState, iconSet, iconSize);
  }
}

class _StateIconButtonState extends State<StateIconButton> {
  final StateCallBack callBack;
  final Map<ButtonState, Widget> iconSet;
  final Size iconSize;

  ButtonState currentState = ButtonState.normal;

  _StateIconButtonState(
      this.callBack, this.currentState, this.iconSet, this.iconSize);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: ButtonState.normal,
      builder: (BuildContext sContext, snapshot) {
        Widget icon = iconSet[currentState];
        return Container(
          width: iconSize.width,
          height: iconSize.height,
          child: IconButton(
            padding: EdgeInsets.zero,
//            alignment: Alignment.centerLeft,
            icon: icon,
            onPressed: () {
              ButtonState clickState = callBack(currentState);
              setState(() {
                currentState = clickState;
              });
            },
          ),
        );
      },
    );
  }
}
