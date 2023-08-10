import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/services/services.dart';

import '../constant/routes.dart';

class Middleware extends GetMiddleware {
  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    MyServices myServices = Get.find();
    if (myServices.cachStorage.read("firstTime") == false) {
      return const RouteSettings(name: AppRoute.auth);
    }
    return null;
  }
}
