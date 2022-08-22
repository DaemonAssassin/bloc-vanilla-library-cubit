import 'dart:async';
import '/bloc/counter_state.dart';
import 'counter_event.dart';

class CounterBloc {
  CounterBloc() {
    _counterEventStream.listen(_listenEvents);
  }

  final StreamController<CounterEvent> _eventStreamController =
      StreamController();
  final StreamController<CounterState> _stateStreamController =
      StreamController();
  final CounterState _counterState = CounterState();

  //getters
  Stream<CounterEvent> get _counterEventStream => _eventStreamController.stream;
  Stream<CounterState> get counterStateStream => _stateStreamController.stream;
  StreamSink<CounterState> get _counterStateSink => _stateStreamController.sink;
  StreamSink<CounterEvent> get counterEventSink => _eventStreamController.sink;

  void _listenEvents(CounterEvent event) {
    if (event is CounterIncrementEvent) {
      _counterStateSink.add(_counterState..increment());
    } else {
      _counterStateSink.add(_counterState..decrement());
    }
  }
}
