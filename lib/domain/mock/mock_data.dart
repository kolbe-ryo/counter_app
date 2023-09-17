import 'package:flutter/material.dart';

import '../repository/counter/entity/category_info.dart';
import '../repository/counter/entity/counter.dart';

//source: https://www.giantbomb.com/dragon-ball-z/3025-159/characters/
final mockData = <Counter>[
  Counter.init(
    'Banana',
    CategoryInfo('Fruit', Colors.amber),
    1,
    'Food for lunch',
  ),
  Counter.init(
    'Grape',
    CategoryInfo('Fruit', Colors.amber),
    1,
    'Food for reward',
  ),
  Counter.init(
    'Apple',
    CategoryInfo('Fruit', Colors.amber),
    1,
    'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
  ),
  Counter.init(
    'Beer',
    CategoryInfo('Drink', Colors.cyan),
    1,
    'Food for reward',
  ),
  Counter.init(
    'Cola',
    CategoryInfo('Drink', Colors.cyan),
    1,
    'Food for reward',
  ),
  Counter.init(
    'Water',
    CategoryInfo('Drink', Colors.cyan),
    1,
    'Food for lifeline',
  ),
  Counter.init(
    'Beef',
    CategoryInfo('Food', Colors.pinkAccent),
    1,
    'Food for dinner',
  ),
  Counter.init(
    'Onyon',
    CategoryInfo('Food', Colors.pinkAccent),
    1,
    'Food for dinner',
  ),
  Counter.init(
    'Milk',
    CategoryInfo('Drink', Colors.cyan),
    1,
    '',
  ),
];
