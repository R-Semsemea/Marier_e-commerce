import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  //late SharedPreferences sharedPreferences;
  late GetStorage cachStorage;

  Future<MyServices> init() async {
    await GetStorage().initStorage;
    cachStorage=GetStorage();
    //sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
