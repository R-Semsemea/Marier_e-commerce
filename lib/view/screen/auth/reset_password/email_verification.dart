import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/email_verification_controller.dart';
import 'package:marier_ecommerce/core/constant/screen_dimensions.dart';

import '../../../../controller/auth/auth_controller.dart';
import '../../../../core/functions/input_validator.dart';
import '../../../widget/auth/auth_button.dart';
import '../../../widget/auth/auth_text_form_field.dart';
import '../../../widget/auth/auth_title.dart';
import '../../../widget/auth/body_text.dart';

class EmailVerification extends StatelessWidget {
  final AuthControllerImp authController;

  const EmailVerification({Key? key, required this.authController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmailVerificationControllerImp controller =
        Get.put(EmailVerificationControllerImp());
    return Column(
      children: [
        CustomAuthTitle(titleText: "forget_password_title".tr),
        Expanded(
          child: Form(
            key: controller.formKey,
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowIndicator();
                return true;
              },
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenDimension.width * 0.064),
                children: [
                  Divider(height: ScreenDimension.height * 0.0197),
                  CustomBodyText(
                    bodyText: "forget_password_body_text".tr,
                  ),
                  Divider(
                    height: ScreenDimension.height * 0.0295,
                  ),
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
                  GetBuilder<EmailVerificationControllerImp>(
                    builder: (controller) => CustomAuthButton(
                        isWaiting: controller.isWaiting,
                        buttonLabel: "email_verification_button".tr,
                        onPressed: controller.onPressSendNewPassword),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
