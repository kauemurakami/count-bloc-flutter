import 'dart:async';
import 'home_event.dart';

class HomeBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>(); //controla o estado do nosso contador nesse caso int
  StreamSink<int> get _inCounter => _counterStateController.sink; 

  Stream<int> get counter => _counterStateController.stream; 

  final _counterEventController = StreamController<HomeEvent>();
  Sink<HomeEvent> get counterEventSink => _counterEventController.sink;

  HomeBloc() {
    _counterEventController.stream.listen(_mapEventState);
  }

  //recebe os eventos e retorna um stado
  void _mapEventState(HomeEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    }
    if (event is DecrementEvent) {
      _counter--;
    }
    _inCounter.add(_counter);
  }
  @override
  void dispose(){
    _counterStateController.close();
    _counterEventController.close();
  }
}
