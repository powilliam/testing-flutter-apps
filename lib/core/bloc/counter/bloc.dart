import 'package:bloc/bloc.dart';
import 'package:testing_flutter_apps/core/bloc/counter/event.dart';

class CounterBloC extends Bloc<CounterEvent, int> {
  CounterBloC() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    if (event is CounterIncremented) {
      yield* _mapEventCounterIncremented(event);
    }
    else if (event is CounterDecremented) {
      yield* _mapEventCounterDecremented(event);
    }
    else if (event is CounterResets) {
      yield* _mapEventCounterResets(event);
    }
  }
  
  Stream<int> _mapEventCounterIncremented(CounterIncremented event) async* {
    yield state + 1;
  }
  Stream<int> _mapEventCounterDecremented(CounterDecremented event) async* {
    yield state - 1;
  }
  Stream<int> _mapEventCounterResets(CounterResets event) async* {
    yield 0;
  }
}