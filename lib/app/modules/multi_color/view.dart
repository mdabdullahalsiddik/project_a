import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
class MultiColorView extends GetView<MultiColorController> {
  const MultiColorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Color'.tr)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: controller.colors.length,
          itemBuilder: (context, index) {
            final colorItem = controller.colors[index];
            final colorCodeString = colorItem['code']!;
            final colorValue = Color(int.parse(colorCodeString));

            return Obx(() {
              return ListTile(
                title: Text(
                  colorItem['name'] ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                trailing: Radio<Color>(
                  fillColor: WidgetStateProperty.all(controller.primaryColor),
                  value: colorValue,
                  groupValue: controller.selectedColor.value,
                  onChanged: (value) {
                    if (value != null) controller.changeColor(value);
                  },
                ),
                onTap: () => controller.changeColor(colorValue),
              );
            });
          },
        ),
      ),
      
    );
  }
}