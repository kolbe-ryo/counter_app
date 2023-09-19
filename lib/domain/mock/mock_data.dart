import 'package:flutter/material.dart';

import '../repository/counter/entity/category_info.dart';
import '../repository/counter/entity/counter.dart';

//source: https://www.giantbomb.com/dragon-ball-z/3025-159/characters/
final mockData = <Counter>[
  Counter.init(
    'Banana',
    CategoryInfo(name: 'Fruit', color: Colors.amber),
    1,
    'Food for lunch',
  ),
  Counter.init(
    'Grape',
    CategoryInfo(name: 'Fruit', color: Colors.amber),
    1,
    'Food for reward',
  ),
  Counter.init(
    'Apple',
    CategoryInfo(name: 'Fruit', color: Colors.amber),
    1,
    'TestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTestTest',
  ),
  Counter.init(
    'Beer',
    CategoryInfo(name: 'Drink', color: Colors.cyan),
    1,
    'Food for reward',
  ),
  Counter.init(
    'Cola',
    CategoryInfo(name: 'Drink', color: Colors.cyan),
    1,
    'Food for reward',
  ),
  Counter.init(
    'Water',
    CategoryInfo(name: 'Drink', color: Colors.cyan),
    1,
    'Food for lifeline',
  ),
  Counter.init(
    'Beef',
    CategoryInfo(name: 'Food', color: Colors.pinkAccent),
    1,
    'Food for dinner',
  ),
  Counter.init(
    'Onyon',
    CategoryInfo(name: 'Food', color: Colors.pinkAccent),
    1,
    'Food for dinner',
  ),
  Counter.init(
    'Milk',
    CategoryInfo(name: 'Drink', color: Colors.cyan),
    1,
    '',
  ),
];

final categoryData = [
  CategoryInfo(
    name: 'Food',
    color: Colors.pinkAccent,
  ),
  CategoryInfo(
    name: 'Drink',
    color: Colors.cyan,
  ),
  CategoryInfo(
    name: 'Fruit',
    color: Colors.pinkAccent,
  ),
];
