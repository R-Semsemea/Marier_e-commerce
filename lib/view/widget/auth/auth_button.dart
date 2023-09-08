import 'package:flutter/material.dart';
import 'package:marier_ecommerce/core/constant/color.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

class CustomAuthButton extends StatelessWidget {
  final String buttonLabel;
  final void Function()? onPressed;
  final bool isWaiting;

  const CustomAuthButton(
      {Key? key,
      required this.buttonLabel,
      this.onPressed,
      this.isWaiting = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenDimension.height * 0.0677,
      margin: EdgeInsets.only(bottom: ScreenDimension.height * 0.0369),
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(25)),
      child: MaterialButton(
          onPressed: isWaiting ? null : onPressed,
          child: isWaiting
              ? const CircularProgressIndicator(
                  color: AppColor.white,
                )
              : Text(
                  buttonLabel,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColor.white),
                )),
    );
  }
}
