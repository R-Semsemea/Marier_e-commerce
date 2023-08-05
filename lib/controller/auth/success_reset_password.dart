import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  checkEmail();

  navToLogIn();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  checkEmail() {}

  @override
  navToLogIn() {
    Get.offAllNamed(AppRoute.logIn);
  }
}
