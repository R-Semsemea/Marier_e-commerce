import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  bool obscureText = true;

  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  checkEmail();

  onPressPasswordVisibility();

  navToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  @override
  checkEmail() {}

  @override
  navToSuccessResetPassword() {
    //Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  onPressPasswordVisibility() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}
