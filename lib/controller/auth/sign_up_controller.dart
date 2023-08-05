import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  bool obscureText = true;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  signUp();

  navToLogIn();

  navToVerificationCode();

  onPressPasswordVisibility();
}

class SignUpControllerImp extends SignUpController {
  @override
  signUp() {}

  @override
  navToLogIn() {
    Get.offAllNamed(AppRoute.logIn);
  }

  @override
  navToVerificationCode() {
    Get.toNamed(AppRoute.verificationCode);
  }

  @override
  onPressPasswordVisibility() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    rePasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }
}
