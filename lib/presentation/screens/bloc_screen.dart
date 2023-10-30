import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formsapp/presentation/blocs/counter_bloc/bloc/counter_bloc.dart';

class BlockCounterScreen extends StatelessWidget {
  const BlockCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]){
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) => Text("Counter Bloc: ${bloc.state.translactionCount}")),
        actions: [
          IconButton(
             // onPressed: () => context.read<CounterBloc>().add(const CounterReset())
              onPressed: () => context.read<CounterBloc>().resetCounter()
              , icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) => Text("Counter value: ${counterBloc.state.counter}",style: textStyle.titleLarge))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: '1',
              child: const Text("+3"),
              onPressed: () => increaseCounterBy(context,3)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '2',
              child: const Text("+2"),
              onPressed: () => increaseCounterBy(context,2)),
          const SizedBox(height: 15),
          FloatingActionButton(
              heroTag: '3',
              child: const Text("+1"),
              onPressed: () => increaseCounterBy(context,1)),
        ],
      ),
    );
  }
}
