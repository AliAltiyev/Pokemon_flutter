import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static const appName = "Pokemon";

  static TextStyle appBarTextStyle() {
    return const TextStyle(
        color: Colors.white,
        fontSize: 40,
        fontWeight: FontWeight.w700
    );
  }

}
