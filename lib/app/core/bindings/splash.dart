import 'package:get/get.dart';

import '../../modules/splash/controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
    
  }
}
