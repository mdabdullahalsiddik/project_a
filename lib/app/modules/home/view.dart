import 'package:flutter/material.dart';
import 'package:foodfinder/app/core/constant/assets.dart';
import 'package:foodfinder/app/global_widgets/app_text.dart';
import 'package:foodfinder/app/global_widgets/common_product_card.dart';
import 'package:foodfinder/app/modules/home/controller.dart';
import 'package:foodfinder/app/routes/route_names.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(AppAssets.logo, width: 20, height: 20),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Get.toNamed(RouteNames.profile),
                        icon: Icon(Icons.person, size: 20, color: Theme.of(context).shadowColor),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 10),
                  // _buildSearchBar(context),
                ],
              ),
            ),
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
      
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText("All product are available".tr, size: 14, weight: FontWeight.w500),
                const SizedBox(height: 20),
                controller.filteredList.isEmpty
                    ? Center(child: CustomText("No products found".tr, size: 12))
                    : CommonFoodWrapCard(
                        itemCount: controller.filteredList.length,
                        items: controller.filteredList,
                        onTap: () {controller.payment("10", "USD");},
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 16, color: Theme.of(context).shadowColor.withOpacity(.30)),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontSize: 10,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w300,
              ),
              onChanged: controller.search,
              decoration: InputDecoration(
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                hintText: "Search for products".tr,
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: Theme.of(context).shadowColor.withOpacity(.30),
                  fontSize: 10,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
