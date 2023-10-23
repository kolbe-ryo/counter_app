import 'package:counter_app/domain/exceptions.dart';
import 'package:counter_app/domain/repository/counter/entity/category_info.dart';
import 'package:counter_app/domain/repository/counter/entity/counter.dart';
import 'package:counter_app/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Empty Counter Domain Test', () {
    const empty = 'empty';
    final counter = Counter.empty();
    test('name should start at empty', () {
      expect(counter.name.value, empty);
    });
    test('value should start at 0', () {
      expect(counter.count.count, 0);
    });
    test('increment', () {
      final counterIncrement = counter.increment();
      expect(counterIncrement.count.count, 1);
    });
    test('increment over 99', () {
      var counterIncrement = counter;
      for (var i = 0; i < 100; i++) {
        counterIncrement = counterIncrement.increment();
      }
      expect(counterIncrement.count.count, 99);
    });
    test('decrement', () {
      final counterDecrement = counter.decrement();
      expect(counterDecrement.count.count, 0);
    });
    test('decrement over 0', () {
      final counterDecrement = counter.decrement();
      expect(counterDecrement.count.count, 0);
    });
    test('category is empty', () {
      expect(counter.categoryInfo.name, empty);
    });
    test('category color is initial one', () {
      expect(counter.categoryInfo.color, Colors.grey);
    });
  });

  group('Boundary Test', () {
    test('Count validation check', () {
      try {
        Counter.init(
          '',
          CategoryInfo(
            name: 'empty',
            color: Colors.grey,
          ),
          0,
          '',
        );
      } on ValidatorException catch (e) {
        logger.info(e);
        expect(ValidatorException.invalidArgument(), e);
      }
    });
  });
}
