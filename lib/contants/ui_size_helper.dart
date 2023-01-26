import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UISizeHelper {
  UISizeHelper._();

  static double getAppHeight() {
    return ScreenUtil().orientation == Orientation.portrait ? 0.15.sh : 0.15.sw;
  }

  static double calculatePokeImageSize() {
    if (ScreenUtil().orientation == Orientation.portrait) {
      return 40.sh;
    } else {
      return 30.sw;
    }
  }

  static Map<String, Color> _pokeColors = {
    "Electric": Colors.blue,
    "Poison": Colors.orangeAccent,
    "Normal": Colors.green,
    "Bug": Colors.red,
    "Water": Colors.lightBlueAccent,
    "Fire": Colors.red.shade900,
    "Grass": Colors.deepPurpleAccent,
  };

  static Color? getColorFromPokeType(String type) {
    if (_pokeColors.containsKey(type)) {
      return _pokeColors[type];
    } else {
      return Colors.black;
    }
  }
}
