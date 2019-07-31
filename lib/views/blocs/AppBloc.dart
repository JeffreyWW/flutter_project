import 'package:bloc/bloc.dart';

class AppBloc extends Bloc {
  @override
  get initialState => "Jeff";

  @override
  Stream mapEventToState(event) async* {
    print(event);
    yield 1;
  }
}
