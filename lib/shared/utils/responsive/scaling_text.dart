import 'dart:math';
import 'package:flutter/material.dart';

class ScaleSize {
  static double textScaleFactor(
    BuildContext context, {
    double maxTextScaleFactor = 2,
  }) {
    final height = MediaQuery.of(context).size.height;
    final double val = (height / 1850) * maxTextScaleFactor;

    return max(0.8, min(val, maxTextScaleFactor));
  }
}
