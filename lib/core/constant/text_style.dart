import 'package:flutter/material.dart';

import 'color.dart';

class AppTextStyle {
  static const TextStyle titleLarge = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.black);
  static const TextStyle labelLarge = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.white);
  static const TextStyle labelMedium = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: AppColor.black);
  static const TextStyle labelSmall = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
      letterSpacing: 0.5);
}
