import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/sign_up_controller.dart';
import 'package:marier_ecommerce/core/constant/routes.dart';

import '../../api_request.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/links.dart';
import '../../core/functions/check_internet_connection.dart';
import '../../core/functions/snack_bar_error.dart';

abstract class NewUserVerificationController extends GetxController {
  bool isWaiting = false;

  checkCode({required String code});

  navToHome();

  onPressResendCode();
}

class NewUserVerificationControllerImp extends NewUserVerificationController {
  late String verifyCode;

  @override
  checkCode({required String code}) async {
    isWaiting = true;
    update();
    FocusManager.instance.primaryFocus?.unfocus(); //unfocused keyboard

    if (await hasNetwork()) {
      ApiRequest apiRequest = Get.find<ApiRequest>();
      Either<Map<String, dynamic>, StatusRequest> response =
          await apiRequest.postRequest(AppLinks.verificationCodeVerify, {
        "email": Get.find<SignUpControllerImp>().emailController.text,
        "verification_code": code
      });
      response.fold((success) => navToHome(), (failure) => snackBar(failure));
    } else {
      snackBar(StatusRequest.offlineError);
    }

    isWaiting = false;
    update();
  }

  @override
  onPressResendCode() {}

  @override
  navToHome() {
    Get.toNamed(AppRoute.home);
  }
}
