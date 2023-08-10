import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/sign_up_controller.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

import '../../../controller/auth/auth_controller.dart';
import '../../../core/constant/routes.dart';
import '../../../core/functions/input_validator.dart';
import '../../widget/auth/auth_button.dart';
import '../../widget/auth/auth_nav.dart';
import '../../widget/auth/auth_social_sign.dart';
import '../../widget/auth/auth_text_form_field.dart';
import '../../widget/auth/auth_title.dart';

class SignUp extends StatelessWidget {
  final AuthControllerImp authController;

  const SignUp({Key? key, required this.authController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Column(
      children: [
        CustomAuthTitle(titleText: "sign_up_title".tr),
        Expanded(
          child: Form(
            key: controller.formKey,
            child: ListView(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenDimension.width * 0.064),
              physics: const BouncingScrollPhysics(),
              children: [
                Divider(height: ScreenDimension.height * 0.0197),
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
                CustomAuthTextFieldForm(
                  inputValidator: (val) {
                    return inputValidator(val!, 10, 10, "phone");
                  },
                  keyboardType: TextInputType.phone,
                  fieldName: "phone_number_label".tr,
                  hintText: "phone_number_hint_text".tr,
                  suffixIcon: Icons.phone_outlined,
                  textEditingController: controller.phoneNumberController,
                ),
                GetBuilder<SignUpControllerImp>(
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
                    onPressedSuffixIcon: controller.onPressPasswordVisibility,
                    textEditingController: controller.passwordController,
                    obscureText: controller.obscureText,
                  ),
                ),
                GetBuilder<SignUpControllerImp>(
                  builder: (controller) => CustomAuthTextFieldForm(
                    inputValidator: (val) {
                      return inputValidator(val!, 8, 30, "password");
                    },
                    keyboardType: TextInputType.text,
                    fieldName: "password_field_label".tr,
                    hintText: "re_password_filed_hint_text".tr,
                    suffixIcon: controller.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    onPressedSuffixIcon: controller.onPressPasswordVisibility,
                    textEditingController: controller.rePasswordController,
                    obscureText: controller.obscureText,
                  ),
                ),
                CustomAuthButton(
                    buttonLabel: "sign_up_button".tr, onPressed: controller.signUp),
                const CustomAuthSocialSign(),
                CustomAuthNavigation(
                  text: "sign_in_navigation".tr,
                  navText: "sign_in_navigation_button".tr,
                  onTap: () {
                    authController.navTo(AppRoute.logIn);
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
