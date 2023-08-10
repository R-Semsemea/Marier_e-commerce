import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';
import 'package:marier_ecommerce/view/screen/auth/reset_password/forget_password.dart';
import 'package:marier_ecommerce/view/screen/auth/sign_up.dart';
import 'package:marier_ecommerce/view/widget/auth/auth_background.dart';

import '../../../controller/auth/auth_controller.dart';
import '../../../core/constant/color.dart';
import 'log_in.dart';

class Auth extends StatelessWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomAuthBackground(),
          GetBuilder<AuthControllerImp>(
            init: AuthControllerImp(),
            builder: (authController) => WillPopScope(
              onWillPop: authController.onWillPop,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  duration: const Duration(milliseconds: 750),
                  onEnd: authController.onEndAnimatePosition,
                  width: ScreenDimension.width,
                  height: authController.isOpenLogIn
                      ? ScreenDimension.height * 0.6724
                      : authController.isOpenSignUp
                          ? ScreenDimension.height * 0.8768
                          : ScreenDimension.height * 0.50,
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 350),
                    onEnd: authController.onEndAnimateOpacity,
                    opacity: authController.visible ? 1 : 0.0,
                    curve: Curves.easeInOut,
                    child: authController.isOpenLogIn
                        ? LogIn(authController: authController)
                        : authController.isOpenSignUp
                            ? SignUp(authController: authController)
                            : ForgetPassword(authController: authController),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
