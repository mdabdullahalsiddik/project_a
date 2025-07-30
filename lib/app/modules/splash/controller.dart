import 'package:flutter/material.dart';
import 'package:foodfinder/app/routes/route_names.dart';
import 'package:get/get.dart';
import '../../core/utils/settings.dart';

class SplashController extends GetxController {
  scheduleNavigationToNextScreen() async {
    await Future.delayed(
      const Duration(seconds: 2),
    ).then((value) => Get.offAllNamed(RouteNames.welcome));
  }

  setAppSettings({required BuildContext context}) async {
    AppSettings.easyloadingSetting(context: context);
    AppSettings.appSafeAreaColorControl(context: context);
  }

  @override
  void onInit() {
    scheduleNavigationToNextScreen();
    super.onInit();
  }
}
