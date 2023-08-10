import 'package:flutter/material.dart';

import 'color.dart';

class AppTextStyle {
  static const TextStyle titleLarge = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
      letterSpacing: 0.5);

/*  static const TextStyle labelLarge = TextStyle(
      fontSize: 14,
      color: AppColor.white,
      letterSpacing: 0.5);*/
  static const TextStyle bodyMedium =
      TextStyle(fontSize: 14, color: AppColor.black, letterSpacing: 0.5);
  static const TextStyle bodySmall =
      TextStyle(fontSize: 12, color: AppColor.black, letterSpacing: 0.5);
}
