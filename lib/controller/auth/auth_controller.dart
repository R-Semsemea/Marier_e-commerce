import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/sign_up_controller.dart';
import 'package:marier_ecommerce/core/constant/color.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

import '../../core/constant/routes.dart';
import 'email_verification_controller.dart';

abstract class AuthController extends GetxController {
  bool isOpenLogIn = true;
  bool isOpenSignUp = false;
  bool isOpenForgetPassword = false;
  bool isOpenVerificationCode = false;
  bool isOpenNewUserVerification = false;
  DateTime? currentBackPressTime;
  bool visible = true;
  String widget = "";
  late PageController forgotPasswordPageController;

  navTo(String widget);

  onEndAnimateOpacity();

  onEndAnimatePosition();

  onRequestEmailVerification();

  onVerificationCodeComplete();

  onResetPasswordComplete();

  Future<bool> onWillPop();
}

class AuthControllerImp extends AuthController {
  @override
  navTo(String widget) {
    this.widget = widget;
    visible = false;
    update();
  }

  @override
  onEndAnimateOpacity() {
    if (widget == AppRoute.logIn) {
      isOpenLogIn = true;
      isOpenSignUp = false;
      isOpenForgetPassword = false;
      isOpenNewUserVerification = false;
    } else if (widget == AppRoute.signUp) {
      isOpenLogIn = false;
      isOpenSignUp = true;
      isOpenForgetPassword = false;
      isOpenNewUserVerification = false;
    } else if (widget == AppRoute.forgetPassword) {
      forgotPasswordPageController = PageController();
      isOpenLogIn = false;
      isOpenSignUp = false;
      isOpenNewUserVerification = false;

      isOpenForgetPassword = true;
    } else if (widget == AppRoute.verificationCode) {
      forgotPasswordPageController = PageController(initialPage: 1);
      isOpenLogIn = false;
      isOpenSignUp = false;
      isOpenNewUserVerification = false;
      isOpenForgetPassword = true;
    } else if (widget == AppRoute.newUserVerification) {
      forgotPasswordPageController = PageController(initialPage: 1);
      isOpenLogIn = false;
      isOpenSignUp = false;
      isOpenForgetPassword = false;
      isOpenNewUserVerification = true;
    }
    update();
  }

  @override
  onEndAnimatePosition() {
    visible = true;
    update();
  }

  @override
  Future<bool> onWillPop() async {
    if (isOpenLogIn) {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
        currentBackPressTime = now;
        Get.snackbar(
          'Press back again to exit',
          '',
          titleText: const Text(
            "Press back again to exit",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor),
          ),
          barBlur: 0,
          overlayBlur: 1,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          colorText: AppColor.black,
          maxWidth: ScreenDimension.width * 0.75,
          borderRadius: 20,
          isDismissible: false,
        );
        return Future.value(false);
      }
    } else if (isOpenSignUp) {
      if (Get.find<SignUpControllerImp>().isWaiting) {
        return Future.value(false);
      } else {
        navTo(AppRoute.logIn);
        update();
        return Future.value(false);
      }
    } else if (isOpenForgetPassword) {
      if (Get.find<EmailVerificationControllerImp>().isWaiting) {
        return Future.value(false);
      } else {
        navTo(AppRoute.logIn);
        update();
        return Future.value(false);
      }
    }
    //exit(0);
    return Future.value(true);
  }

  @override
  onRequestEmailVerification() {
    forgotPasswordPageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  onVerificationCodeComplete() {
    forgotPasswordPageController.animateToPage(2,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  onResetPasswordComplete() async {
    HapticFeedback.lightImpact();
    onWillPop();
  }

  @override
  void dispose() {
    forgotPasswordPageController.dispose();
    super.dispose();
  }
}
