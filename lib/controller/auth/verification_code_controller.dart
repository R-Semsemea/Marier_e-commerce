import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/routes.dart';

abstract class VerificationCodeController extends GetxController {
  checkCode();

  navToResetPassword();
}

class VerifyCodeControllerImp extends VerificationCodeController {
  late String verifyCode;

  @override
  checkCode() {}

  @override
  navToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
