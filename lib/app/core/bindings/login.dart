import 'package:foodfinder/app/modules/auth/login/controller.dart';
import 'package:get/get.dart';


class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}



