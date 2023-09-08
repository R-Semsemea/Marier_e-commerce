import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/links.dart';
import 'package:marier_ecommerce/core/constant/routes.dart';
import 'package:marier_ecommerce/core/functions/check_internet_connection.dart';
import 'package:marier_ecommerce/core/functions/snack_bar_error.dart';

import '../../api_request.dart';
import '../../core/class/status_request.dart';

abstract class LogInController extends GetxController {
  bool obscureText = true;
  bool isWaiting = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;

  logIn();

  navToSignUp();

  navToForgetPassword();

  onPressPasswordVisibility();
}

class LogInControllerImp extends LogInController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  logIn() async {
    isWaiting = true;
    update();
    FocusManager.instance.primaryFocus?.unfocus(); //unfocused keyboard
    FormState? formState = formKey.currentState;
    if (formState!.validate()) {
      if (await hasNetwork()) {
        ApiRequest apiRequest = Get.find();
        Either<Map<String, dynamic>, StatusRequest> response = await apiRequest
            .postRequest(AppLinks.logIn, {
          "email": emailController.text,
          "password": passwordController.text
        });

        response.fold((success) => Get.toNamed(AppRoute.home),
            (failure) => snackBar(failure));
      } else {
        snackBar(StatusRequest.offlineError);
      }
    }
    isWaiting = false;
    update();
  }

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
