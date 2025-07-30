// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:foodfinder/app/core/constant/assets.dart';
import 'package:foodfinder/app/global_widgets/app_button.dart';
import 'package:foodfinder/app/global_widgets/app_text.dart';
import 'package:foodfinder/app/routes/route_names.dart';
import 'package:get/get.dart';

import 'controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  WelcomeView({Key? key}) : super(key: key);

  final PageController pageController = PageController();
  static const int totalPages = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(() {
                      return controller.currentPage.value < totalPages - 1
                          ? GestureDetector(
                              onTap: () {
                                pageController.jumpToPage(totalPages - 1);
                              },
                              child: CustomText("Skip".tr, color: Theme.of(context).scaffoldBackgroundColor, size: 12, weight: FontWeight.w500),
                            )
                          : const SizedBox();
                    }),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        children: [
                          Expanded(child: _pages(context)),
                          Obx(() => buildPageIndicator(context, controller.currentPage.value)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 64),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() {
                        final isLastPage = controller.currentPage.value == totalPages - 1;
                        return CustomButton(
                          onTap: () {
                            if (isLastPage) {
                              Get.offAllNamed(RouteNames.login);
                            } else {
                              pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
                            }
                          },
                          title: isLastPage ? "Continue".tr : "Next".tr,
                          height: 47,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 4,
                          fontSize: 12,
                          fWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        );
                      }),
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

  PageView _pages(context) {
    return PageView(
      controller: pageController,
      onPageChanged: controller.changePage,
      children: [
        buildPage(
          context: context,
          image: AppAssets.welcome1,
          description:
              """
    <div style="text-align: center;">
      <h2>${'Welcome to foodfinder!'.tr}</h2>
      <p>${'Your one-stop solution to discover and order food from top local restaurants.'.tr}</p>
    </div>
  """,
        ),

        buildPage(
          context: context,
          image: AppAssets.welcome2,
          description:
              """
            <div style="text-align: center;">
              <h2>${'Get Your Favorite Food Delivered Fast!'.tr}</h2>
              <p>${'Explore nearby restaurants, order your favorite meals, and enjoy fast delivery to your doorstep.'.tr}</p>
            </div>
          """,
        ),
        buildPage(
          context: context,
          image: AppAssets.welcome3,
          description:
              """
    <div style="text-align: center;">
      <h2>${'Enjoy Your Favorite Food!'.tr}</h2>
      <p>${'Order delicious meals from top-rated restaurants and enjoy them in the comfort of your home.'.tr}</p>
    </div>
  """,
        ),
      ],
    );
  }

  Widget buildPage({required context, required String image, required String description}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, width: 200, height: 200, fit: BoxFit.fill),
        const SizedBox(height: 16),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0), child: HtmlWidget(description)),
      ],
    );
  }

  Widget buildPageIndicator(BuildContext context, int currentPage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalPages, (index) {
        final isActive = currentPage == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 14 : 6,
          height: 6,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: isActive ? Theme.of(context).primaryColor : Colors.grey.shade300),
        );
      }),
    );
  }
}
