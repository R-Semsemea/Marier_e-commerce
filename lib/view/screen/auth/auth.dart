import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';
import 'package:marier_ecommerce/view/screen/auth/new_user_verification.dart';
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
            builder: (controller) => WillPopScope(
              onWillPop: controller.onWillPop,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  decoration: const BoxDecoration(
                    color: AppColor.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  duration: const Duration(milliseconds: 750),
                  onEnd: controller.onEndAnimatePosition,
                  width: ScreenDimension.width,
                  height: controller.isOpenLogIn
                      ? ScreenDimension.height * 0.6724
                      : controller.isOpenSignUp
                          ? ScreenDimension.height * 0.82 //0.8768
                          : ScreenDimension.height * 0.50,
                  curve: Curves.easeInOut,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 350),
                    onEnd: controller.onEndAnimateOpacity,
                    opacity: controller.visible ? 1 : 0.0,
                    curve: Curves.easeInOut,
                    child: controller.isOpenLogIn
                        ? const LogIn()
                        : controller.isOpenSignUp
                            ? const SignUp()
                            : controller.isOpenNewUserVerification
                                ? const NewUserVerification()
                                : const ForgetPassword(),
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
