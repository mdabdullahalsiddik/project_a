import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodfinder/app/data/local/storage.dart';
import 'package:get/get.dart';

class MultiColorController extends GetxController {
  late final Color defaultColor;
  late final Rx<Color> selectedColor;

  final List<Map<String, String>> colors = [
    {'name': 'Dark Pink', 'code': '0xffCA1469'},
    {'name': 'Pink', 'code': '0xFFD81B60'},
    {'name': 'Blue', 'code': '0xFF38B6FF'},
    {'name': 'Light Blue', 'code': '0xFF03A9F4'},
    {'name': 'Cyan', 'code': '0xFF00BCD4'},
    {'name': 'Orange', 'code': '0xFFFB6330'},
    {'name': 'Deep Orange', 'code': '0xFFFF5722'},
    {'name': 'OrangeAccent', 'code': '0xFFFB8C00'},

    {'name': 'Red', 'code': '0xFFE53935'},
    {'name': 'Purple', 'code': '0xFF8E24AA'},

    {'name': 'Teal', 'code': '0xFF00897B'},

    {'name': 'Indigo', 'code': '0xFF3949AB'},
    {'name': 'Amber', 'code': '0xFFFFC107'},
    {'name': 'Green', 'code': '0xFF43A047'},
    {'name': 'Lime', 'code': '0xFFCDDC39'},
    {'name': 'Light Green', 'code': '0xFF8BC34A'},
    {'name': 'Brown', 'code': '0xFF795548'},
    {'name': 'Grey', 'code': '0xFF9E9E9E'},
    {'name': 'Deep Purple', 'code': '0xFF673AB7'},
  ];

  Color get primaryColor => selectedColor.value;
  Color get surfaceColor => primaryColor.withOpacity(0.2);

  @override
  void onInit() {
    super.onInit();

    defaultColor = Color(int.parse(colors.first['code']!));
    selectedColor = defaultColor.obs;

    loadStoredColor();
  }

  Future<void> loadStoredColor() async {
    String? storedCode = await LocalData().readData(key: "color");

    // The storedCode is a string like "4278180336" (int value of color)
    final parsedInt = int.tryParse(storedCode);
    if (parsedInt != null) {
      selectedColor.value = Color(parsedInt);
      return;
    }

    // fallback if no stored or invalid code
    selectedColor.value = defaultColor;
    await LocalData().writeData(key: "color", value: defaultColor.value.toString());
  }

  void changeColor(Color newColor) {
    selectedColor.value = newColor;
    LocalData().writeData(key: "color", value: newColor.value.toString());
  }
}
