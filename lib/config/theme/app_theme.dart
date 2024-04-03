import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.red,
  Colors.green,
  Colors.grey,
  Colors.yellow,
  Colors.blue,
  Colors.purple,
  Colors.amber,
  Colors.cyan,
  Colors.blue
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, 'Selected color must be greater theen 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
      appBarTheme: const AppBarTheme(centerTitle: true),
      colorSchemeSeed: colorList[selectedColor],
      brightness: Brightness.dark
    );
}
