import 'package:foodfinder/app/core/bindings/initial.dart';
import 'package:foodfinder/app/core/bindings/language.dart';
import 'package:foodfinder/app/core/bindings/login.dart';
import 'package:foodfinder/app/core/bindings/multi_color.dart';
import 'package:foodfinder/app/core/bindings/profile.dart';
import 'package:foodfinder/app/core/bindings/welcome.dart';
import 'package:foodfinder/app/modules/auth/login/views.dart';
import 'package:foodfinder/app/modules/home/view.dart';
import 'package:foodfinder/app/modules/language/view.dart';
import 'package:foodfinder/app/modules/multi_color/view.dart';
import 'package:foodfinder/app/modules/profile/view.dart';
import 'package:foodfinder/app/modules/splash/view.dart';
import 'package:foodfinder/app/modules/welcome/view.dart';
import 'package:get/get.dart';

import '../core/bindings/search.dart';
import 'route_names.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: RouteNames.splash, page: () => SplashView(), binding: InitialBinding()),

    GetPage(name: RouteNames.home, page: () => const HomeView(), binding: SearchBinding()),

    GetPage(name: RouteNames.profile, page: () => ProfileView(), binding: ProfileBinding()),

    GetPage(name: RouteNames.login, page: () => LoginView(), binding: LoginBinding()),

    GetPage(name: RouteNames.welcome, page: () => WelcomeView(), binding: WelcomeBinding()),

    GetPage(name: RouteNames.multiColor, page: () => MultiColorView(), binding: MultiColorBinding()),

    GetPage(name: RouteNames.language, page: () => LanguageView(), binding: LanguageBinding()),
  ];
}
