
import 'package:flutter/material.dart';
import 'package:foodfinder/app/core/constant/assets.dart';
import 'package:foodfinder/app/global_widgets/app_button.dart';
import 'package:foodfinder/app/global_widgets/app_text.dart';
import 'package:get/get.dart';

void CustomLogoutDialog(BuildContext context, controller) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            insetPadding: const EdgeInsets.all(8),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              width: constraints.maxWidth - 40,
              padding: const EdgeInsets.all(32),
              child: Column(
                spacing: 16,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(height: 8),
                  Image.asset(AppAssets.logoutIcon, color: Theme.of(context).primaryColor, width: 70, height: 70, fit: BoxFit.fill),

                  CustomText("Logout".tr, size: 20, color: Theme.of(context).primaryColor, weight: FontWeight.w600, align: TextAlign.center),

                  CustomText("Are you sure you want to logout?".tr, size: 12, align: TextAlign.center, weight: FontWeight.w400),

                  CustomButton(
                    title: "Logout".tr,
                    height: 50,
                    width: double.maxFinite,
                    fontSize: 16,
                    borderRadius: 10,
                    fWeight: FontWeight.w600,
                    onTap: () {
                      controller.logout();
                    },
                  ),

                  TextButton(
                    onPressed: () => Get.back(),
                    child: CustomText("Cancel".tr, color: Theme.of(context).textTheme.headlineLarge!.color, size: 14, weight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}