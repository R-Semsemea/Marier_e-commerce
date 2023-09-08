import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../api_request.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/links.dart';
import '../../core/functions/check_internet_connection.dart';
import '../../core/functions/snack_bar_error.dart';
import 'auth_controller.dart';
import 'email_verification_controller.dart';

abstract class ResetPasswordController extends GetxController {
  bool obscureText = true;
  bool isWaiting = false;

  late TextEditingController passwordController;
  late TextEditingController rePasswordController;

  onPressPasswordVisibility();

  onPressChangePassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  onPressChangePassword() async {
    isWaiting = true;
    update();
    FocusManager.instance.primaryFocus?.unfocus(); //unfocused keyboard
    FormState? formState = formKey.currentState;

    if (formState!.validate()) {
      if (await hasNetwork()) {
        ApiRequest apiRequest = Get.find<ApiRequest>();
        Either<Map<String, dynamic>, StatusRequest> response =
            await apiRequest.postRequest(AppLinks.resetPassword, {
          "email":
              Get.find<EmailVerificationControllerImp>().emailController.text,
          "password": passwordController.text
        });
        response.fold(
            (success) =>
                Get.find<AuthControllerImp>().onResetPasswordComplete(),
            (failure) => snackBar(failure));
      } else {
        snackBar(StatusRequest.offlineError);
      }
    }

    isWaiting = false;
    update();
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
