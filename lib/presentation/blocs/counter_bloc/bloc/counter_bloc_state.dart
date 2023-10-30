part of 'counter_bloc.dart';

 class CounterBlocState extends Equatable {

  final int counter;
  final int translactionCount;

  const CounterBlocState({
   this.counter = 10,
   this.translactionCount = 0
   });

   CounterBlocState copyWith({
    int? counter,
    int? translactionCount,
   }) => CounterBlocState(
    counter: counter ?? this.counter,
    translactionCount: translactionCount ?? this.translactionCount);
  
  @override
  List<Object> get props => [counter, translactionCount];
}

final class CounterBlocInitial extends CounterBlocState {}
