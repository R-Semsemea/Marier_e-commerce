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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  signUp() {
    var formState = formKey.currentState;
    if (formState!.validate()) {
      print("Valid");
    } else {
      print("Not Valid");
    }
  }

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
    emailController = TextEditingController(text: "john@example.com");
    phoneNumberController = TextEditingController(text: "0949494949");
    passwordController = TextEditingController(text: "12345678");
    rePasswordController = TextEditingController(text: "12345678");
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
