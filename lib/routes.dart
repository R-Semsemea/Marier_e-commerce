import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:marier_ecommerce/view/screen/Home.dart';
import 'package:marier_ecommerce/view/screen/auth/auth.dart';
import 'package:marier_ecommerce/view/screen/select_language.dart';

import 'core/constant/routes.dart';
import 'core/middleware/middleware.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const SelectLanguage(),
      middlewares: [Middleware()]),
  GetPage(name: AppRoute.auth, page: () => const Auth()),
  GetPage(name: AppRoute.home, page: () => const Home()),
];

//Flutter Navigation
Map<String, Widget Function(BuildContext)> routess = {
  //OnBoarding
  AppRoute.selectLanguage: (context) => const SelectLanguage(),
  AppRoute.auth: (context) => const Auth(),
};
