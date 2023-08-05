import 'package:flutter/material.dart';

class CustomAuthTitleText extends StatelessWidget {
  final String titleText;

  const CustomAuthTitleText({Key? key, required this.titleText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
