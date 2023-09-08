import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:marier_ecommerce/view/screen/auth/reset_password/reset_password.dart';
import 'package:marier_ecommerce/view/screen/auth/reset_password/verification_code.dart';

import '../../../../controller/auth/auth_controller.dart';
import 'email_verification.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthControllerImp>(
      builder: (authController) => PageView(
        controller: authController.forgotPasswordPageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          EmailVerification(
            authController: authController,
          ),
          VerificationCode(
            authController: authController,
          ),
          ResetPassword(
            authController: authController,
          )
        ],
      ),
    );
  }
}
