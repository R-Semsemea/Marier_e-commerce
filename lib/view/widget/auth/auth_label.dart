import 'package:flutter/material.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

class CustomAuthLabel extends StatelessWidget {
  final String labelText;

  const CustomAuthLabel({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: ScreenDimension.height * 0.0283,
        child: Text(
          labelText,
          style: Theme.of(context).textTheme.labelSmall,
        ));
  }
}
