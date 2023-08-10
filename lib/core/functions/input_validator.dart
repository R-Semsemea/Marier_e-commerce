import 'package:get/get.dart';

String? inputValidator(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Can't be empty";
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Invalid Email!";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Invalid Phone Number!";
    }
  }

  if (val.length < min) {
    return "Can't be less than $min characters";
  }

  if (val.length > max) {
    return "Can't be more than $min characters";
  }

  return null;
}
