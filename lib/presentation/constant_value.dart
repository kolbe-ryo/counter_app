import 'package:flutter/material.dart';

import '../domain/repository/counter/entity/category_info.dart';

/// For Layout
const kPadding = 16.0;

const cardHeight = 60;

const settingIconSize = 40.0;

/// For Webview
const aboutAppUrl = 'https://kolbe-app.site/';

const contactUrl = '${aboutAppUrl}contact/';

/// Default Category
final defaultCategory = [
  CategoryInfo(
    name: 'Food',
    color: appColors[0],
  ),
  CategoryInfo(
    name: 'Drink',
    color: appColors[1],
  ),
  CategoryInfo(
    name: 'Consumable',
    color: appColors[2],
  ),
  CategoryInfo(
    name: 'Beauty/Health',
    color: appColors[3],
  ),
  CategoryInfo(
    name: 'Clothing/Accessories',
    color: appColors[4],
  ),
];

/// Colors
const appColors = [
  // Colors.pink,
  Colors.pinkAccent,
  Colors.red,
  // Colors.redAccent,
  // Colors.deepOrange,
  Colors.deepOrangeAccent,
  Colors.orange,
  // Colors.orangeAccent,
  // Colors.amber,
  Colors.amberAccent,
  // Colors.yellow,
  Colors.yellowAccent,
  Colors.lime,
  Colors.limeAccent,
  Colors.lightGreen,
  Colors.lightGreenAccent,
  Colors.green,
  Colors.greenAccent,
  Colors.teal,
  // Colors.tealAccent,
  Colors.cyan,
  Colors.cyanAccent,
  // Colors.lightBlue,
  // Colors.lightBlueAccent,
  // Colors.blue,
  Colors.blueAccent,
  Colors.indigo,
  // Colors.indigoAccent,
  Colors.purple,
  Colors.purpleAccent,
  // Colors.deepPurple,
  Colors.deepPurpleAccent,
  Colors.blueGrey,
  Colors.brown,
  Colors.grey,
  Colors.black,
];
