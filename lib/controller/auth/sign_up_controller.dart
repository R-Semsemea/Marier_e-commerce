import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/api_request.dart';
import 'package:marier_ecommerce/controller/auth/auth_controller.dart';
import 'package:marier_ecommerce/core/constant/routes.dart';
import 'package:marier_ecommerce/core/functions/check_internet_connection.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/links.dart';
import '../../core/functions/snack_bar_error.dart';

abstract class SignUpController extends GetxController {
  bool obscureText = true;
  bool isWaiting = false;

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
  signUp() async {
    isWaiting = true;
    update();
    FocusManager.instance.primaryFocus?.unfocus(); //unfocused keyboard
    FormState? formState = formKey.currentState;
    if (formState!.validate()) {
      if (await hasNetwork()) {
        ApiRequest apiRequest = Get.find();
        Either<Map<String, dynamic>, StatusRequest> response =
            await apiRequest.postRequest(AppLinks.signUp, {
          "email": emailController.text,
          "password": passwordController.text,
          "phoneNumber": phoneNumberController.text
        });

        response.fold(
            (success) => Get.find<AuthControllerImp>()
                .navTo(AppRoute.newUserVerification),
            (failure) => snackBar(failure));
      } else {
        snackBar(StatusRequest.offlineError);
      }
    }
    isWaiting = false;
    update();
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
