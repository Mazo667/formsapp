part of 'counter_bloc.dart';

sealed class CounterBlocEvent extends Equatable {
  const CounterBlocEvent();

  @override
  List<Object> get props => [];
}

class CounterIncreased extends CounterBlocEvent{

  final int value;

  const CounterIncreased(this.value);

   @override
  List<Object> get props => [value];
  
}

class CounterReset extends CounterBlocEvent{

  const CounterReset();
}