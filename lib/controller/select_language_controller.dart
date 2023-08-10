import 'package:get/get.dart';
import 'package:marier_ecommerce/core/localization/change_local.dart';
import 'package:marier_ecommerce/core/services/services.dart';

abstract class SelectLanguageController extends GetxController {
  void onPress(String langCode);

  String getLocaleLanguage();
}

class SelectLanguageControllerImp extends SelectLanguageController {
  @override
  void onPress(String langCode) {
    LocaleController controller = Get.find();
    MyServices myServices = Get.find();
    controller.changeLang(langCode);
    myServices.cachStorage.write("firstTime", false);

  }

  @override
  String getLocaleLanguage() {
    LocaleController controller = Get.find();
    return controller.language!.languageCode;
  }
}
