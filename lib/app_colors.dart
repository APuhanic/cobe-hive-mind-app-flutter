import 'package:flutter/material.dart';

abstract class AppColors {
  static const background = Color.fromRGBO(246, 248, 252, 1);

  static const text = Color.fromRGBO(61, 71, 102, 1);
  static const textSecondary = Colors.white;
  static const textAccent = Color.fromRGBO(188, 196, 220, 1);
  static const textOrange = Color.fromRGBO(252, 68, 2, 1);

  static const accent = Color.fromRGBO(188, 196, 220, 1);
  static const primary = Color.fromRGBO(252, 68, 2, 1);

  static const widgetBackground = Colors.white;

  static const overlayShadow = Color.fromRGBO(36, 36, 36, 1);
  static const shadow = Color.fromRGBO(58, 73, 88, 0.08);

  static const green = Color.fromRGBO(0, 186, 136, 1);
  static const greenShadow = Color.fromRGBO(0, 186, 136, 0.3);
  static const orangeShadow = Color.fromRGBO(252, 68, 2, 0.3);

  static const orangeGradient = LinearGradient(
    colors: [
      Color.fromRGBO(255, 110, 78, 1),
      Color.fromRGBO(252, 68, 2, 1),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
