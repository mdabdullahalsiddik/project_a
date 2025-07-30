import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:foodfinder/app/modules/auth/login/controller.dart';
import 'package:foodfinder/app/routes/route_names.dart';
import 'package:get/get.dart';
class ProfileController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();

  String get name => loginController.userName.value;
  String get email => loginController.userEmail.value;
  String get imageUrl => loginController.userImage.value;
  String get provider => loginController.loginType.value;

  Future<void> logout() async {
    await loginController.logout();
  }
}
