import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:workout_timer/data/source/data_repository.dart';

class BaseBloc<E> {
  @protected
  final DataRepository repository;

  BaseBloc(this.repository);

  final _eventQueue = StreamController<E>();
  Stream<E> get eventObservable => _eventQueue.stream;

  @protected
  void addEvent(E event) {
    _eventQueue.sink.add(event);
  }

  void dispose() {
    _eventQueue.close();
  }
}
