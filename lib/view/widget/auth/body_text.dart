import 'package:flutter/material.dart';

class CustomBodyText extends StatelessWidget {
  final String bodyText;

  const CustomBodyText({Key? key, required this.bodyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      bodyText,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
