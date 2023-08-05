import 'package:flutter/material.dart';

class ScreenDimension {
  static double width = 0;
  static double height = 0;

  static void init(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    width = mediaQueryData.size.width;
    height = mediaQueryData.size.height;
  }
}
