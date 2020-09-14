import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_flutter_apps/core/bloc/counter/bloc.dart';
import 'package:testing_flutter_apps/core/bloc/counter/event.dart';

void main() {
  CounterBloC counterBloC;

  setUp(() {
    counterBloC = CounterBloC();
  });

  blocTest<CounterBloC, int>('Should be able to increment the state',
      build: () => counterBloC,
      act: (bloc) => bloc.add(CounterIncremented()),
      expect: <int>[1]);
  blocTest<CounterBloC, int>('Should be able to decrement the state',
      build: () => counterBloC,
      act: (bloc) => bloc.add(CounterDecremented()),
      expect: <int>[-1]);

  blocTest<CounterBloC, int>('Should be able to reset the state',
      build: () => counterBloC,
      act: (bloc) => bloc..add(CounterIncremented())..add(CounterResets()),
      expect: <int>[1, 0]);
}
