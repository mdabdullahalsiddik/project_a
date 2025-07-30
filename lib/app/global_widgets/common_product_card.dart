import 'package:flutter/material.dart';
import 'package:foodfinder/app/core/constant/app_text.dart';
import 'package:foodfinder/app/global_widgets/app_text.dart';
import 'package:foodfinder/app/modules/home/controller.dart';
import 'package:get/get.dart';

class CommonFoodWrapCard extends StatelessWidget {
  CommonFoodWrapCard({super.key, required this.itemCount, required this.items, this.onTap});

  final int itemCount;
  var items;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 7,
      runSpacing: 7,

      children: List.generate(itemCount, (index) {
        final item = items[index];
        return GestureDetector(
          onTap: onTap,
          child: Container(
            height: 160,
            width: MediaQuery.of(context).size.width * 0.28,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 69,
                  width: 106,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(image: NetworkImage(item['image'] ?? ''), fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 6),
                CustomText(
                  item['title'] ?? '',
                  align: TextAlign.start,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  size: 10,
                  weight: FontWeight.w500,
                ),
                const SizedBox(height: 8),
                item['offer_price'] == null
                    ? CustomText('${AppText.currencySymbol}${item['price']}', align: TextAlign.start, size: 10, weight: FontWeight.w700)
                    : Row(
                        spacing: 2,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomText(
                            '${AppText.currencySymbol}${item['offer_price']}',
                            align: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            size: 10,
                            weight: FontWeight.w700,
                          ),
                          CustomText(
                            '${AppText.currencySymbol}${item['price']}',
                            align: TextAlign.start,

                            overflow: TextOverflow.ellipsis,
                            size: 8,
                            weight: FontWeight.w500,
                            decoration: TextDecoration.lineThrough,
                            color: Theme.of(context).shadowColor.withOpacity(.50),
                          ),
                        ],
                      ),

                const SizedBox(height: 7),
                GestureDetector(
                  onTap: () {
                    HomeController controller = Get.find();
                    controller.payment(item['price'].toString(), "USD");
                  },
                  child: Container(
                    height: 17,

                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Theme.of(context).primaryColor),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 12),
                          CustomText('Bye Now'.tr, color: Theme.of(context).canvasColor, size: 10, weight: FontWeight.w500),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
