import 'dart:async';

/// Events triggered from view 
enum CounterEvent {
  /// Increment counter event
  Increment,
}



class CounterBloc {
  /// StreamController to handle event stream
  final _eventController = StreamController<CounterEvent>();
  Stream<CounterEvent> get eventStream => _eventController.stream;
  Sink<CounterEvent> get eventSink => _eventController.sink;

  /// StreamController to handle counter stream
  final _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;
  Sink<int> get counterSink => _counterController.sink;

  /// manage counter
  /// initial value of counter is 0
  int _counter = 0;

// Constructor
CounterBloc() {
    eventStream.listen((CounterEvent event) { 
      /// This call back will be called when new event will be added from sink 
      
      if(event == CounterEvent.Increment){
        /// if event is CounterEvent.Increment then increment the counter and 
        /// send the updated counter using counter stream
        ++_counter;
        counterSink.add(_counter);
      }

    });
  }

  /// call this method to close all the streams
  /// call this method in dispose method of stateful widget
  /// always a good practice to close all the stream at the end
  void dispose() {
    _eventController.close();
    _counterController.close();
  }
}

