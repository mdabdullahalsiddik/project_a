import 'package:flutter/material.dart';
import 'package:foodfinder/app/core/constant/assets.dart';
import 'package:foodfinder/app/modules/splash/controller.dart';
import 'package:get/get.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.setAppSettings(context: context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(child: Image.asset(AppAssets.logo, height: 100, width: 100)),
    );
  }
}
