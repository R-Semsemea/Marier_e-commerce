import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/sign_up_controller.dart';

import '../../controller/auth/reset_password_controller.dart';

String? inputValidator(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Can't be empty";
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Invalid Email!";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Invalid Phone Number!";
    }
  }

  if (type == "signUpPassword") {
    if (Get.find<SignUpControllerImp>().passwordController.text !=
        Get.find<SignUpControllerImp>().rePasswordController.text) {
      return "Password don't match!";
    }
  }
  if (type == "resetPassword") {
    if (Get.find<ResetPasswordControllerImp>().passwordController.text !=
        Get.find<ResetPasswordControllerImp>().rePasswordController.text) {
      return "Password don't match!";
    }
  }
  if (val.length < min) {
    return "Can't be less than $min characters";
  }

  if (val.length > max) {
    return "Can't be more than $min characters";
  }

  return null;
}
