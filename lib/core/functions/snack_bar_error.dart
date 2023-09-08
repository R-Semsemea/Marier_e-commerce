import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marier_ecommerce/core/class/status_request.dart';

SnackbarController snackBar(StatusRequest failure) {
  return Get.snackbar(
    '',
    '',
    titleText: Text(
      failure == StatusRequest.wrongCredentials
          ? "snack_bar_error_1".tr
          : failure == StatusRequest.emailExists
              ? "snack_bar_error_2".tr
              : failure == StatusRequest.serverError
                  ? "snack_bar_error_3".tr
                  : failure == StatusRequest.offlineError
                      ? "snack_bar_error_4".tr
                      : failure == StatusRequest.statusCode
                          ? "snack_bar_error_5".tr
                          : failure == StatusRequest.emailNotExists
                              ? "snack_bar_error_6".tr
                              : "Unknown_error".tr,
      textAlign: TextAlign.center,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white70),
    ),
    barBlur: 0,
    overlayBlur: 0.5,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 2),
    backgroundColor: Colors.transparent,
  );
}
