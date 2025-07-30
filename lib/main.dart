import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:foodfinder/app/core/bindings/initial.dart';
import 'package:foodfinder/app/core/constant/app_text.dart';
import 'package:foodfinder/app/core/language/localization.dart';
import 'package:foodfinder/app/data/local/storage.dart';
import 'package:foodfinder/app/modules/auth/login/controller.dart';
import 'package:foodfinder/app/modules/multi_color/controller.dart';
import 'package:foodfinder/app/routes/route_names.dart';
import 'package:foodfinder/firebase_options.dart';
import 'package:get/get.dart';

import 'app/core/theme/light.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(LoginController());
  await Get.put(MultiColorController());
  // Lock orientation to portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  WidgetsBinding.instance.addPostFrameCallback((_) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(Get.context!).primaryColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Theme.of(Get.context!).primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
  });
  // Load saved language from local storage or fallback
  final savedLang = await LocalData().readData(key: 'language');
  final parts = savedLang.split('_');
  final startLocale = parts.length >= 2 ? Locale(parts[0], parts[1]) : const Locale('en', 'US');
  runApp(MyApp(languageType: startLocale));
}

class MyApp extends StatelessWidget {
  final Locale languageType;

  const MyApp({super.key, required this.languageType});

  @override
  Widget build(BuildContext context) {
    final colorController = Get.find<MultiColorController>();

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        title: AppText.appName,
        initialBinding: InitialBinding(),
        theme: AppLightTheme.lightTheme(colorController), // Dynamic theme with reactive color
        darkTheme: AppLightTheme.lightTheme(colorController),
        themeMode: ThemeMode.system,
        initialRoute: RouteNames.splash,
        getPages: AppRoutes.routes,
        locale: languageType,
        translations: Localization(),
      ),
    );
  }
}
