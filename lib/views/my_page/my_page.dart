import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/blocs/floor/floor_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPageState();
  }
}

class _MyPageState extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FloorBloc bloc = FloorBloc();
    var _isLoading = false;
    var _txt = "点击后这里会显示请求过来的id";

    return Scaffold(
      body: BlocProvider<FloorBloc>(
          builder: (BuildContext context) => bloc,
          child: BlocBuilder<FloorBloc, FloorState>(
            builder: (BuildContext context, state) {
              print("state");
              if (state is FloorLoadingState) {
                _isLoading = true;
              }
              if (state is FloorGetState) {
                _isLoading = false;
                _txt = state.floor.floorInfoList.first.floorId;
              }
              if(state  is FloorFailState) {
                _isLoading = false;
              }

              return ModalProgressHUD(
                child: Center(
                    child: FlatButton(
                  child: Text(_txt),
                  onPressed: () {
                    BlocProvider.of<FloorBloc>(context)
                        .dispatch(GetFloorEvent());
                  },
                )),
                inAsyncCall: _isLoading,
                opacity: 0.1,
                dismissible: true,
                progressIndicator: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
