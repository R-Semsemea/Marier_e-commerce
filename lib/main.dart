import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/constant/text_style.dart';
import 'package:marier_ecommerce/core/localization/change_local.dart';
import 'package:marier_ecommerce/core/services/services.dart';
import 'package:marier_ecommerce/routes.dart';
import 'package:marier_ecommerce/view/screen/auth/auth.dart';

import 'core/constant/color.dart';
import 'core/localization/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  //runApp(DevicePreview(builder: (context) => const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      //builder: DevicePreview.appBuilder,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
        dividerColor: AppColor.transparent,
        fontFamily: "Montserrat",
        textTheme: const TextTheme(
          titleLarge: AppTextStyle.titleLarge,
          labelLarge: AppTextStyle.labelLarge,
          labelMedium: AppTextStyle.labelMedium,
          labelSmall: AppTextStyle.labelSmall,
        ),
      ),
      routes: routes,
      home: const Auth(),
    );
  }
}
