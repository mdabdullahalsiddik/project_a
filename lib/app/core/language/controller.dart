

import 'dart:developer';
import 'dart:ui';

import 'package:get/get.dart';

import '../../data/local/storage.dart';

class LanguageController extends GetxController {
  static const String defaultLangCode = 'en_US';
  var selectedLanguage = defaultLangCode.obs;

 final List<Map<String, String>> languages = [
  {'name': 'English', 'code': 'en_US'},
  {'name': 'বাংলা', 'code': 'bn_BD'},
  {'name': 'Português', 'code': 'pt_PT'},
  {'name': 'Français', 'code': 'fr_FR'}, // French in its own script
  {'name': 'Deutsch', 'code': 'de_DE'},   // German in its own script
  {'name': 'Italiano', 'code': 'it_IT'},  // Italian in its own script
  {'name': '中文', 'code': 'zh_CN'},      // Chinese in its own script
  {'name': '한국어', 'code': 'ko_KR'},      // Korean in its own script
  {'name': 'Español', 'code': 'es_ES'},    // Spanish in its own script
  {'name': 'हिन्दी', 'code': 'hi_IN'},    // Hindi in its own script
  {'name': '日本語', 'code': 'ja_JP'},      // Japanese in its own script
  {'name': 'Русский', 'code': 'ru_RU'},    // Russian in its own script
  {'name': 'العربية', 'code': 'ar_SA'},    // Arabic in its own script
  {'name': 'Türkçe', 'code': 'tr_TR'},    // Turkish in its own script
  {'name': 'Nederlands', 'code': 'nl_NL'},// Dutch in its own script
  {'name': 'Polski', 'code': 'pl_PL'},    // Polish in its own script
  {'name': 'اردو', 'code': 'ur_PK'},      // Urdu in its own script
  {'name': 'ไทย', 'code': 'th_TH'},        // Thai in its own script
  {'name': 'Tiếng Việt', 'code': 'vi_VN'},// Vietnamese in its own script
  {'name': 'Bahasa Melayu', 'code': 'ms_MY'}, // Malay in its own script (commonly written in Latin script)
];


  @override
  void onInit() {
    super.onInit();
    loadStoredLanguage();
  }

  Future<void> loadStoredLanguage() async {
    String? storedLanguage = await LocalData().readData(key: "language");

    if (languages.any((lang) => lang['code'] == storedLanguage)) {
      selectedLanguage.value = storedLanguage;
      log("Loaded stored language: ${selectedLanguage.value}");
    } else {
      selectedLanguage.value = defaultLangCode;
      await LocalData().writeData(key: "language", value: defaultLangCode);
      log("No stored language found. Defaulting to: $defaultLangCode");
    }

    Get.updateLocale(_getLocaleFromCode(selectedLanguage.value));
  }

  void changeLanguage(String localeCode) {
    selectedLanguage.value = localeCode;
    Get.updateLocale(_getLocaleFromCode(localeCode));
    LocalData().writeData(key: "language", value: localeCode);
  }

  Locale _getLocaleFromCode(String code) {
    final parts = code.split('_');
    return Locale(parts[0], parts[1]);
  }
}