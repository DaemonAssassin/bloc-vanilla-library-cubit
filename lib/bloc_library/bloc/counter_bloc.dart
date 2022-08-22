import 'counter_event.dart';
import 'counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterIncrementEvent>(
      (event, emitter) {
        state.increment();
        int value = state.count;
        emitter.call(CounterState(value));
      },
    );
    on<CounterDecrementEvent>(
      (event, emitter) {
        state.decrement();
        int value = state.count;
        emitter.call(CounterState(value));
      },
    );
  }
}
