import 'package:flutter/material.dart';

import '../../../core/constant/screen_dimensions.dart';

class CustomAuthTitle extends StatelessWidget {
  final String titleText;

  const CustomAuthTitle({Key? key, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: ScreenDimension.height * 0.0665,
        child: Align(
          alignment: const Alignment(0, 0.8),
          child: Text(titleText, style: Theme.of(context).textTheme.titleLarge),
        ));
  }
}
