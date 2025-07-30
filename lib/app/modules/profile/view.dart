import 'package:flutter/material.dart';
import 'package:foodfinder/app/modules/profile/widget/logout_dialogs.dart';
import 'package:foodfinder/app/modules/profile/widget/profile_image.dart';
import 'package:foodfinder/app/routes/route_names.dart';
import 'package:get/get.dart';

import '../../core/constant/assets.dart';
import '../../global_widgets/app_text.dart';
import 'controller.dart';
import 'widget/profile_and_abroad_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Top Profile Section
              Container(
                width: double.infinity,
                color: theme.primaryColor.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ProfileImageWidget(imageUrl: controller.imageUrl, name: controller.name),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText("Md. Abdullah Al Siddik", weight: FontWeight.w600, size: 14),
                                const SizedBox(height: 4),
                                CustomText("mabdullahalsiddik@gmail.com", weight: FontWeight.w400, size: 12),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
      
              // Settings Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileAndAbroadCard(title: "Language".tr, icon: AppAssets.languageIcon, onTap: () => Get.toNamed(RouteNames.language)),
                    ProfileAndAbroadCard(title: "Color".tr, icon: AppAssets.colorIcon, onTap: () => Get.toNamed(RouteNames.multiColor)),
      
                    ProfileAndAbroadCard(
                      title: "Logout".tr,
                      icon: AppAssets.logoutIcon,
                      onTap: () async {
                        CustomLogoutDialog(context, controller);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
