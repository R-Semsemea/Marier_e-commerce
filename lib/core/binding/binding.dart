import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

import '../../api_request.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiRequest());
  }
}
