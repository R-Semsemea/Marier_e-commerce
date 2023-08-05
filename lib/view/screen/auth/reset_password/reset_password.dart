import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/scroll_physics.dart';
import 'package:marier_ecommerce/view/widget/auth/auth_button.dart';

import '../../../../controller/auth/auth_controller.dart';
import '../../../../controller/auth/reset_password_controller.dart';
import '../../../../core/constant/screen_dimensions.dart';
import '../../../widget/auth/auth_text_form_field.dart';
import '../../../widget/auth/auth_title.dart';

class ResetPassword extends StatelessWidget {
  final AuthControllerImp authController;

  const ResetPassword({Key? key, required this.authController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAuthTitle(titleText: "New Password"),
        Expanded(
          child: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenDimension.width * 0.064),
            physics: AppScrollPhysics.scrollPhysics,
            children: [
              Divider(height: ScreenDimension.height * 0.0197),
              Text(
                '''Congratulations on successfully verifying your account! Now, please set a new password for your account. Your new password should be strong and secure to protect your personal information.''',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Divider(height: ScreenDimension.height * 0.0197),
              GetBuilder<ResetPasswordControllerImp>(
                init: ResetPasswordControllerImp(),
                builder: (controller) => CustomAuthTextFieldForm(
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
              GetBuilder<ResetPasswordControllerImp>(
                builder: (controller) => CustomAuthTextFieldForm(
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
              const CustomAuthButton(buttonLabel: "Change Password"),
            ],
          ),
        )
      ],
    );
  }
}
