import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/image_asset.dart';
import 'package:marier_ecommerce/view/widget/select_language/language_button.dart';

import '../../core/localization/change_local.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImageAsset.authBackgroundImage))),
          ),
          Align(
            alignment: const Alignment(0.0, 0.7),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LanguageButton(
                    buttonLabel: "English",
                    flagCode: "GB",
                    fontFamily: "Montserrat",
                    changeLocaleTo: "en"),
                Divider(),
                LanguageButton(
                    buttonLabel: "العربية",
                    flagCode: "SY",
                    fontFamily: "Cairo",
                    changeLocaleTo: "ar"),
                MaterialButton(
                  onPressed: controller.myServices.cacheStorage.erase,
                  child: Text("erase"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
