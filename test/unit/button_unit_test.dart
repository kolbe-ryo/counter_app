// TODO: Unitテストを記述すること

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test name', () {
    final counter = Counter();

    counter.increment();

    expect(counter.value, 1);
  });
}

class Counter {
  int value = 0;

  void increment() => value++;

  void decrement() => value--;
}
