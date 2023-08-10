import 'package:flutter/material.dart';
import 'package:marier_ecommerce/core/constant/text_style.dart';

import 'color.dart';

ThemeData arTheme = ThemeData(
  dividerColor: AppColor.transparent,
  fontFamily: "Cairo",
  textTheme: const TextTheme(
    titleLarge: AppTextStyle.titleLarge,
    bodyMedium: AppTextStyle.bodyMedium,
    bodySmall: AppTextStyle.bodySmall,
  ),
);

ThemeData enTheme = ThemeData(
  dividerColor: AppColor.transparent,
  fontFamily: "Montserrat",
  textTheme: const TextTheme(
    titleLarge: AppTextStyle.titleLarge,
    bodyMedium: AppTextStyle.bodyMedium,
    bodySmall: AppTextStyle.bodySmall,
  ),
);
