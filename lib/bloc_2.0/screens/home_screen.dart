import 'package:flutter/material.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = CounterBloc();
    print('build');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder<CounterState>(
          // initialData: ,
          stream: counterBloc.counterStateStream,
          builder: (context, snapshot) {
            bool hasWaitingOrNone =
                snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.connectionState == ConnectionState.none;
            bool hasActiveOrDone =
                snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done;
            if (hasWaitingOrNone) {
              return const CircularProgressIndicator();
            } else if (hasActiveOrDone) {
              print('streambuilder ${snapshot.data!.count}');

              return Text(
                '${snapshot.data!.count}',
                style: const TextStyle(
                  fontSize: 96.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              );
            } else {
              return const Text(
                'No Data Found',
                style: TextStyle(
                  fontSize: 96.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.counterEventSink.add(CounterIncrementEvent());
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.counterEventSink.add(CounterDecrementEvent());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
