import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/sign_up_controller.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

import '../../../controller/auth/auth_controller.dart';
import '../../../core/constant/routes.dart';
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
        const CustomAuthTitle(titleText: "Sign Up"),
        Expanded(
          child: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenDimension.width * 0.064),
            physics: const BouncingScrollPhysics(),
            children: [
              Divider(height: ScreenDimension.height * 0.0197),
              CustomAuthTextFieldForm(
                fieldName: "E-mail",
                hintText: 'ebizmirli@marier.com',
                suffixIcon: Icons.email_outlined,
                textEditingController: controller.emailController,
              ),
              CustomAuthTextFieldForm(
                fieldName: "Phone Number",
                hintText: '+90 555 555 44 33',
                suffixIcon: Icons.phone_outlined,
                textEditingController: controller.phoneNumberController,
              ),
              GetBuilder<SignUpControllerImp>(
                builder:(controller)=> CustomAuthTextFieldForm(
                  fieldName: "Password",
                  hintText: 'Password',
                  suffixIcon: controller.obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressedSuffixIcon: controller.onPressPasswordVisibility,
                  textEditingController: controller.passwordController,
                  obscureText: controller.obscureText,
                ),
              ),
              GetBuilder<SignUpControllerImp>(
                builder:(controller)=> CustomAuthTextFieldForm(
                  fieldName: "Password",
                  hintText: 'Password Again',
                  suffixIcon: controller.obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  onPressedSuffixIcon: controller.onPressPasswordVisibility,
                  textEditingController: controller.rePasswordController,
                  obscureText: controller.obscureText,
                ),
              ),
              CustomAuthButton(buttonLabel: "SIGN UP", onPressed: () {}),
              const CustomAuthSocialSign(),
              CustomAuthNavigation(
                text: "Already have an account ? ",
                navText: "Sign In",
                onTap: () {
                  authController.navTo(AppRoute.logIn);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
