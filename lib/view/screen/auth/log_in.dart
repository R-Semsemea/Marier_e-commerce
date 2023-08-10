import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/log_in_controller.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';
import 'package:marier_ecommerce/core/constant/scroll_physics.dart';
import 'package:marier_ecommerce/core/functions/input_validator.dart';

import '../../../controller/auth/auth_controller.dart';
import '../../../core/constant/routes.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_nav.dart';
import '../../widget/auth/auth_social_sign.dart';
import '../../widget/auth/auth_text_form_field.dart';
import '../../widget/auth/auth_title.dart';

class LogIn extends StatelessWidget {
  final AuthControllerImp? authController;

  const LogIn({Key? key, required this.authController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogInControllerImp controller = Get.put(LogInControllerImp());
    return Column(
      children: [
        CustomAuthTitle(titleText: "sign_in_title".tr),
        Expanded(
          child: Form(
            key: controller.formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenDimension.width * 0.064),
              physics: AppScrollPhysics.scrollPhysics,
              children: [
                Divider(height: ScreenDimension.height * 0.032),
                CustomAuthTextFieldForm(
                  inputValidator: (val) {
                    return inputValidator(val!, 5, 100, "email");
                  },
                  keyboardType: TextInputType.emailAddress,
                  fieldName: "email_filed_label".tr,
                  hintText: "email_filed_hint_text".tr,
                  suffixIcon: Icons.email_outlined,
                  textEditingController: controller.emailController,
                ),
                GetBuilder<LogInControllerImp>(
                  builder: (controller) => CustomAuthTextFieldForm(
                    inputValidator: (val) {
                      return inputValidator(val!, 8, 30, "password");
                    },
                    keyboardType: TextInputType.text,
                    fieldName: "password_field_label".tr,
                    hintText: "password_filed_hint_text".tr,
                    suffixIcon: controller.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    textEditingController: controller.passwordController,
                    onPressedSuffixIcon: controller.onPressPasswordVisibility,
                    obscureText: controller.obscureText,
                  ),
                ),
                SizedBox(
                    height: ScreenDimension.height * 0.0480,
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        authController!.navTo(AppRoute.forgetPassword);
                      },
                      child: Text("forgot_password_label".tr,
                          textAlign: TextAlign.end,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                    )),
                CustomAuthButton(
                    buttonLabel: "login_button".tr,
                    onPressed: controller.logIn),
                const CustomAuthSocialSign(),
                CustomAuthNavigation(
                  text: "sign_up_navigation".tr,
                  navText: "sign_up_navigation_button".tr,
                  onTap: () {
                    authController!.navTo(AppRoute.signUp);
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
