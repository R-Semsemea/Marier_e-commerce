import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/services/services.dart';

import '../constant/themes.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();
  late ThemeData appTheme;

  changeLang(String langCode) {
    Locale local = Locale(langCode);
    myServices.cachStorage.write("lang", langCode);
    Get.updateLocale(local);
    if (langCode == "ar") {
      appTheme = arTheme;
      Get.changeTheme(appTheme);
    }
  }

  @override
  void onInit() {
    String? cacheStorageLang = myServices.cachStorage.read("lang");

    if (cacheStorageLang == "ar") {
      appTheme = arTheme;
      language = const Locale("ar");
    } else if (cacheStorageLang == "en") {
      appTheme = enTheme;
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      if (Get.deviceLocale!.languageCode == "ar") {
        appTheme = arTheme;
      } else {
        appTheme = enTheme;
      }
    }
    super.onInit();
  }
}
