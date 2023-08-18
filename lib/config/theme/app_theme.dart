import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
        brightness: Brightness.dark,
      );
}
