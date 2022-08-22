import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_state.dart';

enum CounterEvent { initialEvent, increment, decrement }

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(0));

  void mapEvents(CounterEvent event) {
    if (event == CounterEvent.increment) {
      emit(CounterState(state.count + 1));
    } else {
      emit(CounterState(state.count - 1));
    }
  }
}

