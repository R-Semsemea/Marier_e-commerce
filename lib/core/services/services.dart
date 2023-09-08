import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyServices extends GetxService {
  //late SharedPreferences sharedPreferences;
  late GetStorage cacheStorage;

  Future<MyServices> init() async {
    await GetStorage().initStorage;
    cacheStorage = GetStorage();
    //sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
