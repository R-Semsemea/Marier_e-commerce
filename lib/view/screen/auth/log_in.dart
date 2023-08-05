import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/log_in_controller.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';
import 'package:marier_ecommerce/core/constant/scroll_physics.dart';

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
        const CustomAuthTitle(titleText: "Sign In"),
        Expanded(
          child: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenDimension.width * 0.064),
            physics: AppScrollPhysics.scrollPhysics,
            children: [
              Divider(height: ScreenDimension.height * 0.032),
              CustomAuthTextFieldForm(
                fieldName: "E-mail",
                hintText: 'ebizmirli@marier.com',
                suffixIcon: Icons.email_outlined,
                textEditingController: controller.emailController,
              ),
              GetBuilder<LogInControllerImp>(
                builder: (controller) => CustomAuthTextFieldForm(
                  fieldName: "Password",
                  hintText: 'Password',
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
                    child: Text("Forgot Password?",
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.labelSmall),
                  )),
              CustomAuthButton(buttonLabel: "LOGIN", onPressed: () {}),
              const CustomAuthSocialSign(),
              CustomAuthNavigation(
                text: "Don’t have an account? ",
                navText: "Sign Up",
                onTap: () {
                  authController!.navTo(AppRoute.signUp);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
