import 'package:flutter/material.dart';

import '../../../core/constant/image_asset.dart';

class CustomAuthBackground extends StatelessWidget {
  const CustomAuthBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImageAsset.authBackgroundImage))),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0x80000000),
        ),
      ],
    );
  }
}
