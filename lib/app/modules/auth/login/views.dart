import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodfinder/app/core/constant/assets.dart';
import 'package:foodfinder/app/global_widgets/app_button.dart';
import 'package:foodfinder/app/global_widgets/app_text.dart';
import 'package:foodfinder/app/modules/auth/login/widget/field.dart';
import 'package:foodfinder/app/routes/route_names.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top logo area
            Container(
              color: Theme.of(context).primaryColor,
              height: 300,
              child: Center(
                child: Image.asset(AppAssets.logo, width: 100, height: 100, fit: BoxFit.fill),
              ),
            ),

            // Login Card
            Container(
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // Add text fields or other login fields if required

                  const SizedBox(height: 10),
                  _socialLogin(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Social Media Buttons
  Column _socialLogin(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _socialMediaIcon(
              context: context,
              onTap: () => controller.loginWithGoogle(),
              icon: AppAssets.googleIcon,
              title: "Google".tr,
            ),
            _socialMediaIcon(
              context: context,
              onTap: () => controller.loginWithFacebook(),
              icon: AppAssets.facebookIcon,
              title: "Facebook".tr,
            ),
            // Add Apple login if needed
          ],
        ),
      ],
    );
  }

  /// Social Media Icon Button Widget
  GestureDetector _socialMediaIcon({
    required BuildContext context,
    required String icon,
    required String title,
    void Function()? onTap,
    double? width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: Theme.of(context).primaryColor.withOpacity(.10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(color: Colors.transparent, width: 1),
        ),
        child: SizedBox(
          height: 40,
          width: width ?? MediaQuery.of(context).size.width / 3.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon, width: 15, height: 15, fit: BoxFit.contain),
              const SizedBox(width: 8),
              CustomText(
                title,
                fontFamily: "Inter",
                size: 12,
                weight: FontWeight.w400,
                color: Theme.of(context).textTheme.headlineLarge!.color,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
