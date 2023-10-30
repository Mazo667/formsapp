import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //El valor de CounterCubit solo va a vivir aca
    return BlocProvider(
        create: (_) => CounterCubit(),
        child: _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });
  
  void increaseBy(BuildContext context, int value){
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    //escucho cambios en el state
    //final counterState = context.watch<CounterCubit>().state;

    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) => Text('Cubit Counter: ${value.state.transactionCount}')),
       // title: Text('Cubit Counter: ${counterState.transactionCount}'),
        actions: [
          IconButton(onPressed: () => context.read<CounterCubit>().reset()
              , icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
          child: BlocBuilder<CounterCubit,CounterState>(

            //Solo construime el bloc si cambia el counter del estado
           // buildWhen: (previous, current) => current.counter != previous.counter,
              builder: (context, state) {
                print("el bloc cambio");
             return Text("Counter value: ${state.counter}",style: textStyle.titleLarge);
              })

      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              child: const Text("+3"),
              onPressed: () => increaseBy(context,3)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2',
              child: const Text("+2"),
              onPressed: () => increaseBy(context,2)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3',
              child: const Text("+1"),
              onPressed: () => increaseBy(context,1)),
        ],
      ),
    );
  }
}
