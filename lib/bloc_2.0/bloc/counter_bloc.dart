import 'dart:async';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc {
  CounterBloc() {
    _counterEventStream.listen(listenEvents);
  }

  final _scCounterEvent = StreamController<CounterEvent>();
  final _scCounterState = StreamController<CounterState>();

  Stream<CounterEvent> get _counterEventStream => _scCounterEvent.stream;
  Stream<CounterState> get counterStateStream => _scCounterState.stream;
  StreamSink<CounterEvent> get counterEventSink => _scCounterEvent.sink;
  StreamSink<CounterState> get _counterStateSink => _scCounterState.sink;
  final _counterState = CounterState();

  void listenEvents(CounterEvent event) {
    if (event is CounterIncrementEvent) {
      _counterStateSink.add(_counterState..increment());
    } else {
      _counterStateSink.add(_counterState..decrement());
    }
  }
}
