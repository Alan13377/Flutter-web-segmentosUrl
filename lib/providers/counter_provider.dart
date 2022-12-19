import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//*Family para recibir parametros
final counterProvider = ChangeNotifierProvider.family(
    (ref, base) => CounterProvider(base.toString()));

class CounterProvider extends ChangeNotifier {
  int _counter = 0;

  CounterProvider(String base) {
    if (int.tryParse(base) != null) this._counter = int.parse(base);
  }

  get counter {
    return this._counter;
  }

  void increment() {
    this._counter++;
    notifyListeners();
  }

  void decrement() {
    this._counter--;
    notifyListeners();
  }
}
