import 'package:marier_ecommerce/core/class/status_request.dart';

StatusRequest handlingStatusFail({required String msg}) {
  //Log In
  if (msg == "Wrong Credentials") {
    return StatusRequest.wrongCredentials;
  }
  //Sign Up
  else if (msg == "Duplicate entry email") {
    return StatusRequest.emailExists;
  }
  //Verification code request
  else if (msg == "Wrong Email Address") {
    return StatusRequest.emailNotExists;
  }

  return StatusRequest.unknownError;
}
