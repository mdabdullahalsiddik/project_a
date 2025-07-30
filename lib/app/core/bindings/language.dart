import 'package:foodfinder/app/core/language/controller.dart';
import 'package:get/get.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
