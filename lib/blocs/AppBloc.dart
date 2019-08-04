import 'package:bloc/bloc.dart';

class AppBloc extends Bloc<String, int> {
  @override
  get initialState => 5;

  @override
  Stream<int> mapEventToState(event) async* {
    print(event);
    yield currentState + 1;
  }
}
