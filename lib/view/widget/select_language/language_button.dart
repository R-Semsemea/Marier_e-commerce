import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/select_language_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/constant/screen_dimensions.dart';

class LanguageButton extends StatelessWidget {
  final String buttonLabel;
  final String flagCode;
  final String fontFamily;
  final String changeLocaleTo;

  const LanguageButton(
      {Key? key,
      required this.buttonLabel,
      required this.flagCode,
      required this.fontFamily,
      required this.changeLocaleTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectLanguageControllerImp controller = Get.put(SelectLanguageControllerImp());
    return InkWell(
      onTap: () {
        controller.onPress(changeLocaleTo);
        Get.offNamed(AppRoute.auth);
      },
      child: Container(
        width: ScreenDimension.width * 0.30,
        height: ScreenDimension.height * 0.05,
        decoration: BoxDecoration(
            color: controller.getLocaleLanguage() == changeLocaleTo
                ? AppColor.orange
                : Colors.blueGrey,
            borderRadius: BorderRadius.circular(20)),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CountryFlags.flag(
                flagCode,
                borderRadius: 20,
                width: constraints.maxWidth * 0.20,
                height: constraints.maxWidth * 0.20,
              ),
              const VerticalDivider(
                width: 2,
              ),
              SizedBox(
                width: constraints.maxWidth * 0.45,
                child: Text(
                  buttonLabel,
                  style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      fontFamily: fontFamily),
                  textAlign: TextAlign.center,
                  //textAlign: TextAlign.center,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}
