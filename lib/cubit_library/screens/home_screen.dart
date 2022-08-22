import 'package:bloc_ampfibian/cubit_library/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';
import '../cubit/counter_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            print('builderrrr');
            return Text(
              state.count.toString(),
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            );
          },
        ),
      ),
      floatingActionButton: buildFAOs(context),
    );
  }

  Row buildFAOs(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FloatingActionButton(
          onPressed: () {
            counterCubit.mapEvents(CounterEvent.increment);
          },
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            counterCubit.mapEvents(CounterEvent.decrement);
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
