import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/forget_password_controller.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

import '../../../../controller/auth/auth_controller.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/auth_text_form_field.dart';
import '../../../widget/auth/auth_title.dart';

class EmailVerification extends StatelessWidget {
  final AuthControllerImp authController;

  const EmailVerification({Key? key, required this.authController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Column(
      children: [
        const CustomAuthTitle(titleText: "Forgot Password?"),
        Expanded(
          child: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenDimension.width * 0.064),
            physics: const BouncingScrollPhysics(),
            children: [
              Divider(height: ScreenDimension.height * 0.0197),
              Text(
                "Please enter your email address. You will receive a link to create a new password via email.",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Divider(
                height: ScreenDimension.height * 0.0295,
              ),
              CustomAuthTextFieldForm(
                fieldName: "E-mail",
                hintText: 'ebizmirli@marier.com',
                suffixIcon: Icons.email_outlined,
                textEditingController: controller.email,
              ),
              CustomAuthButton(
                  buttonLabel: "SEND NEW PASSWORD",
                  onPressed: authController.onRequestEmailVerification),
            ],
          ),
        )
      ],
    );
  }
}
