import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/auth_controller.dart';

import '../../api_request.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/links.dart';
import '../../core/functions/check_internet_connection.dart';
import '../../core/functions/snack_bar_error.dart';

abstract class EmailVerificationController extends GetxController {
  bool isWaiting = false;

  late TextEditingController emailController;

  onPressSendNewPassword();
}

class EmailVerificationControllerImp extends EmailVerificationController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  onPressSendNewPassword() async {
    isWaiting = true;
    update();
    FocusManager.instance.primaryFocus?.unfocus(); //unfocused keyboard
    FormState? formState = formKey.currentState;
    if (formState!.validate()) {
      if (await hasNetwork()) {
        ApiRequest apiRequest = Get.find<ApiRequest>();
        Either<Map<String, dynamic>, StatusRequest> response = await apiRequest
            .postRequest(AppLinks.verificationCodeRequest,
                {"email": emailController.text});
        response.fold(
            (success) =>
                Get.find<AuthControllerImp>().onRequestEmailVerification(),
            (failure) => snackBar(failure));
      } else {
        snackBar(StatusRequest.offlineError);
      }
    }
    isWaiting = false;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController(text: "john@example.com");
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
