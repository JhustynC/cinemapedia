import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.black,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Color.fromARGB(255, 85, 11, 27)
];

class AppTheme {
  final int selectedColor;
  final bool darkMode;

  AppTheme({
    this.selectedColor = 0,
    this.darkMode = false,
  })  : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: const Color(0xFF2862FF),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  }

  AppTheme copyWith({
    int? selectedColor,
    bool? darkMode,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        darkMode: darkMode ?? this.darkMode,
      );
}
