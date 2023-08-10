import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

import '../../../core/constant/image_asset.dart';
import 'auth_social_sign_button.dart';

class CustomAuthSocialSign extends StatelessWidget {
  const CustomAuthSocialSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenDimension.height * 0.1157,
      padding: EdgeInsets.symmetric(horizontal: ScreenDimension.width * 0.1333),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "log_in_social".tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CustomAuthSocialSignButton(
                logo: AppImageAsset.googleLogo,
              ),
              CustomAuthSocialSignButton(logo: AppImageAsset.facebookLogo),
              CustomAuthSocialSignButton(logo: AppImageAsset.appleLogo),
            ],
          )
        ],
      ),
    );
  }
}
