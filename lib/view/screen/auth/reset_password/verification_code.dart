import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/controller/auth/verification_code_controller.dart';

import '../../../../controller/auth/auth_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/screen_dimensions.dart';
import '../../../../core/constant/scroll_physics.dart';
import '../../../widget/auth/auth_title.dart';

class VerificationCode extends StatelessWidget {
  final AuthControllerImp authController;

  const VerificationCode({Key? key, required this.authController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Column(
      children: [
        const CustomAuthTitle(titleText: "Verification Code"),
        Expanded(
          child: ListView(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenDimension.width * 0.064),
            physics: AppScrollPhysics.scrollPhysics,
            children: [
              Divider(height: ScreenDimension.height * 0.0197),
              Text(
                '''Please enter the verification code we sent to your registered email address. The code is a six-digit number that you should have received in your inbox. If you haven't received the code, click the "Resend Code" button below.''',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Divider(height: ScreenDimension.height * 0.06),
              OtpTextField(
                showCursor: false,
                focusedBorderColor: AppColor.primaryColor,
                enabledBorderColor: AppColor.grey,
                cursorColor: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
                numberOfFields: 6,
                fieldWidth: ScreenDimension.width * 0.1,
                borderWidth: 2,

                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  authController.onVerificationCodeComplete();
                }, // end onSubmit
              ),
              Divider(height: ScreenDimension.height * 0.07),
              Padding(
                padding: EdgeInsets.only(bottom: ScreenDimension.height * 0.03),
                child: Text(
                  "Resend Code",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: AppColor.primaryColor,
                      ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
