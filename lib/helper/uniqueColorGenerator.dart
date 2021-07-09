import 'package:flutter/material.dart';
import 'dart:math' as math;

class UniqueColorGenerator {
  static Color getColor() {

    return 
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    //Colors.black;
  }
}