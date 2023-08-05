import 'package:flutter/material.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

class CustomAuthSocialSignButton extends StatelessWidget {
  final String logo;
  final void Function()? onPressed;

  const CustomAuthSocialSignButton({
    Key? key,
    required this.logo,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenDimension.width * 0.1466,
      height: ScreenDimension.width * 0.1466,
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(10),
        child: IconButton(
          icon: Image.asset(logo, width: ScreenDimension.width * 0.0666),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
