import 'package:bloc_ampfibian/bloc/counter_bloc.dart';
import 'package:bloc_ampfibian/bloc/counter_event.dart';
import 'package:bloc_ampfibian/bloc/counter_state.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyAppWidget());
}

class MyAppWidget extends StatelessWidget {
  const MyAppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({
    Key? key,
  }) : super(key: key);

  CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder<CounterState>(
          stream: counterBloc.counterStateStream,
          builder: (context, snapshot) {
            print('streamBuilder');
            bool isWaitingOrNone =
                snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.connectionState == ConnectionState.none;
            bool isActiveOrDone =
                snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done;
            if (isWaitingOrNone) {
              return const CircularProgressIndicator();
            } else if (isActiveOrDone) {
              return Text(snapshot.data!.count.toString());
            } else {
              return const Text('No Data');
            }
          },
        ),
      ),
      floatingActionButton: buildFAOs(),
    );
  }

  Widget buildFAOs() {
    return Row(
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
    );
  }
}
