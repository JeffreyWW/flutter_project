import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_project/models/floor.dart';
import 'package:flutter_project/repositoies/floor.dart';
import 'package:flutter_project/repositoies/food.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'floor_event.dart';

part 'floor_state.dart';

class FloorBloc extends Bloc<FloorEvent, FloorState> {
  @override
  FloorState get initialState => InitialFloorState();

  @override
  Stream<FloorState> mapEventToState(FloorEvent event) {
    var loading = Observable.just(FloorLoadingState());
    var getResult = FloorRepositories.getHomeFloor()
        .map<FloorState>((floor) => FloorGetState(floor))
        .onErrorReturn(FloorFailState());
    if (event is GetFloorEvent) {
      return Observable.merge([loading, getResult]);
    }

    return Observable.just(InitialFloorState());
  }
}
