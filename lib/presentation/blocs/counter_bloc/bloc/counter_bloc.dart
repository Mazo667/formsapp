import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:formsapp/presentation/blocs/counter_cubit/counter_cubit.dart';

part 'counter_bloc_event.dart';
part 'counter_bloc_state.dart';

class CounterBloc extends Bloc<CounterBlocEvent, CounterBlocState> {
  CounterBloc() : super(CounterBlocInitial()) {


    on<CounterIncreased>(_onCounterIncreased);
    on<CounterReset>(_onCounterReset);
   //De esta manera ordenamos los difentes eventos
   // on<CounterIncreased>(_onCounterIncreased);
   // on<CounterIncreased>(_onCounterIncreased);

  }

  void _onCounterIncreased(CounterIncreased event,Emitter<CounterBlocState> emit){
      emit(state.copyWith(
      counter: state.counter + event.value,
      translactionCount: state.translactionCount + 1
     ));
  }

  void _onCounterReset(CounterReset event,Emitter<CounterBlocState> emit){
    emit(state.copyWith(
        counter: 0,
    ));
  }

  void increasedBy([int value = 1]){
      add(CounterIncreased(value));
  }

  void resetCounter(){
    add(const CounterReset());
  }

}
