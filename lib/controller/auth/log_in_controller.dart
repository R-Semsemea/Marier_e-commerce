import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/routes.dart';

abstract class LogInController extends GetxController {
  bool obscureText = true;

  logIn();

  navToSignUp();

  navToForgetPassword();

  onPressPasswordVisibility();
}

class LogInControllerImp extends LogInController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  logIn() {}

  @override
  navToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  navToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  onPressPasswordVisibility() {
    obscureText = !obscureText;
    update();
  }
}
