import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/language/controller.dart';
import '../../global_widgets/app_text.dart';


class LanguageView extends GetView<LanguageController> {
  const LanguageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Language'.tr)),
     body: Padding(
  padding: const EdgeInsets.all(8.0),
  child: ListView.builder(
    itemCount: controller.languages.length,
    itemBuilder: (context, index) {
      final lang = controller.languages[index];
      return Container(
        child: Obx(() => ListTile(
              title: CustomText(
                lang['name'] ?? '',
                size: 16,
                weight: FontWeight.w500,
              ),
              trailing: Radio<String>(
                fillColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                value: lang['code']!,
                groupValue: controller.selectedLanguage.value,
                onChanged: (value) {
                  if (value != null) {
                    controller.changeLanguage(value);
                  }
                },
              ),
              onTap: () => controller.changeLanguage(lang['code']!),
            )),
      );
    },
  ),
),

    );
  }
}
