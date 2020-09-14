import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<int> get props => [];
}

class CounterIncremented extends CounterEvent {}

class CounterDecremented extends CounterEvent {}

class CounterResets extends CounterEvent {}