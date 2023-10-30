import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterState extends Equatable{

  final int counter;
  final int transactionCount;

  const CounterState({this.counter = 0, this.transactionCount = 0});

  copyWith(int? counter,
      int? transactionCount) =>
      CounterState(
          counter: counter ?? this.counter,
          transactionCount: transactionCount ?? this.transactionCount
      );

  @override
  // TODO: implement props
  List<Object> get props => [counter,transactionCount];
}

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(const CounterState());

  void increaseBy(int value){
    emit(state.copyWith(
      state.counter + value,
      state.transactionCount + 1
    ));
  }

  void reset(){
      emit(state.copyWith(
          0,
          state.transactionCount
      ));
  }

}