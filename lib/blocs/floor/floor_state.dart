part of 'floor_bloc.dart';

@immutable
abstract class FloorState {}

class InitialFloorState extends FloorState {}

class FloorLoadingState extends FloorState {}

class FloorGetState extends FloorState {
  final Floor floor;

  FloorGetState(this.floor);
}

class FloorFailState extends FloorState  {}
