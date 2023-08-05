import 'package:flutter/material.dart';

import '../../../core/constant/screen_dimensions.dart';

class CustomAuthNavigation extends StatelessWidget {
  final String text;
  final String navText;
  final void Function()? onTap;

  const CustomAuthNavigation(
      {Key? key, required this.text, required this.navText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: ScreenDimension.height * 0.0837,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontWeight: FontWeight.normal)),
          InkWell(
            onTap: onTap,
            child: Text(
              navText,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          )
        ],
      ),
    );
  }
}
